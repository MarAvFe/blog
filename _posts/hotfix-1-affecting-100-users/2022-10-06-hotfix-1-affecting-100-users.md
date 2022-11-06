---
layout: post
title:  "Hotfix 1: Affecting 100 users"
date:   2022-10-06 22:30:20 -0600
categories: story experience mistakes hotfix
---

# Context

This is a story. You'll notice it's numbered because I'm 100% sure this is not my last mistake.

For legal reasons, this is hypothetical.

There I was, supporting a Source Control Management (SCM) management tool with +3500 users for a corporation, where we add and remove any required or inactive users. The removal is automatical and runs daily, the addition is automatical and runs twice a day. Everything works like a clock.

# Incident

We had this unusual time where a user was getting removed needlesly and recurrently. They lacked some data in our DB and our automatical job interpreted it as an inactive user. We asked them to update their details but they failed to do so. We then yielded the user incomplete status and agreed to add an exception for them, first mistake. Maybe sticking to policy and forcing users to comply would've avoided this situation?

I went ahead and cloned the script to my PC, and started to work on it.

To cross the data we query all SCM's used licences, then, we query the user status in our DB, and those inactive in our DB, are removed from the SCM tool, easy.

We worked with [pandas][] to query both sides and merge the data into a single dataframe. from all users, we select all users that are _not_ 'active' users and proceed to remove them. The snippet seemed something like:

```python
allUsers = [  # username, status
    ['user1','inactive'],
    ['user2','active'],
    ['user3']
    ]
usersToDisable = allUsers[allUsers['status'] != 'active'] # user 1 & 3
```

So easy to add an exception. From those users that will be disabled, select all of them that are not `user3` which is the exception with missing data. I adapt the snip to:

```python
allUsers = [  # username, status
    ['user1','inactive'],
    ['user2','active'],
    ['user3']
    ]
usersToDisable = allUsers[allUsers['status'] != 'active']  # user 1 and 3
usersToDisable = allUsers[allUsers['username'] != 'user3'] # all users but 3
```

So satisfied with it, I commit, push, deploy and run. (can you spot the mistake?) 

I monitor the output just because, I was positive this was a walk by the park and went for a cup of tea, the script took about 20 min to run. After a while, close to the end I get closer to the screen and see the data query has finished and the users deletion was about to start. The script outputs: `Disabling +3500 users...`. **Then I panicked.**.

Omg. How? I quickly stopped the execution, I check the script and immediately notice the mistake. I needed to add the exception to the selected users to removed, not from the full user list. This is the correct version of it:

```python
allUsers = [  # username, status
    ['user1','inactive'],
    ['user2','active'],
    ['user3']
    ]
usersToDisable = allUsers[allUsers['status'] != 'active'] # user 1 and 3
usersToDisable = usersToDisable[usersToDisable['username'] != 'user3'] # user 1
```

I quickly commit and push, but I disable the automatic execution and get to the remediation. Ok, how many people were affected? **100 users**. 100 people had immediately lost access to our SCM solution; because of the way the SCM license is managed, those affected were the oldest users, usually those who advocate and explore into the tool adoption from the company's side.

I worked quickly with some API scripts up my sleeve. I invited all users back within the first 40 minutes and finished restoring (partially) repositories and teams accesses within the next 7 hours. Then we proceeded to manage users expectations and communicate our incident to the company. 8 work hours or intense remediation and potential 6 figure impact, for a lack of a 5 minute peer reviewing process. Is it worth it? I guess it is.

# Lessons learned

## 1. Test cases

Even though this happened in our CICD pipeline execution, it would've happened in my local environment, as we had no test cases defined within the script. Not unit tests, not tes values, nothing. Any way of testing would'be caught this quickly.

## 2. Feature flags

You can enable or disable tools behavior by modifying its environments with variables. You can also simply choose to prod-execute a process if current git branch is `main`. Else, just do a test run and show us the output. Example:

```python
DEV = True
for user in users:
    if not DEV:
        disableUser(user)
    print(f'disabled user {user}')
```

You can even improve this by reading execution branch

```python
DEV = True if branch == 'main' else False
for user in users:
    if not DEV:
        disableUser(user)
    print(f'disabled user {user}')
```

## 3. Data restore capability

Why did we take 7 hours to restore accesses and not 10 minutes? Because we had not considered a massive restoral before. We were capable to restore by scraping historical data and it worked successfully.

Always consider what happened if you lost everything in prod environment, how will you restore? How can you backup? In this example, this is not a simple Hard Disk Drive (HDD) screenshot copy/paste. You can simply re-create the full set of permissions by having an incremental set of executed actions and then keeping the last version, then you execute this result.

How can you restore a data-based environment? Open to creativity.

## 4. User's expectations

Most of the time, users don't need fixes as urgently as we think or they mention. They simply need to know when will they be back working to adjust accordingly, people understand there are outages and mistakes in dev teams. Just don't lie to them and they'll appreciate it. At first we told users access had been fully restored, which was misleading: they still needed to take action from their side to restore the access, to accept the invite. Our biggest backlash was the sharing of misleading solutions and information. Most users were simply interested in recovering access than pionting fingers.

## 5. Gitflow

Peer review and stage test new features before releasing. [This is simple and straightforward][gitflow]. Still, lots of teams skip the enforcement of peer reviewing processes. Simply put:

> It's a Git branching model that involves the use of feature branches and multiple primary branches.

However, at press time I noticed a new current of [trunk-based workflow](trunkbase) has emerged. How is it different from Gitflow?

> Gitflow has more, longer-lived branches and larger commits than trunk-based development [...] [which] focuses on the main branch as the source of fixes and releases.

# Closure

About 5 users reached out within the first hour, and about 58 customers replied after 3 days or never did. Here's the response rate of these affected users.

<figure>
<img src="{{page.url}}response.png" alt="column chart">
<figcaption>Affected users response</figcaption>
</figure>

Worth noting, most users didn't even feel the incident. But a few critical users are enough to trigger a full postmortem analysis and a chain reaction into processes improvement.

Support management is still part of the service availability and customers perceived support product value.

[pandas]: https://pandas.pydata.org/
[gitflow]: https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
[trunkbase]: https://www.atlassian.com/continuous-delivery/continuous-integration/trunk-based-development
