---
layout: post
title: "How a website stores your password"
date: 2022-11-07 08:00:20 -0600
modified: 2022-11-08 08:50:20 -0600
tags: security password learning
---

As far as a computer cares, us people could be monkeys or slugs on the other side of the keyboard. Based on "a complex intelectual test" of physically using a computer by typing into a keyboard the website name and our username, they can tell us apart from animals. We then added an extra security layer of having a secret word for computers to identify us apart from other humans.

# What is a password?

> A password is a set of characters.

No more than that.

We'll discuss how are passwords safe in a different post. Today we'll talk about how to store it (or not doing it).

For the sake of this post, we'll use example credentials: Username `Gustavo` and password `saf3`.
 
# When is a password required?

Usernames allow services to tell you apart from another person, often your own name. Passwords allow services to tell you apart from another person trying to impersonate you. If you come here and say you're Gustavo and your password is `saf3`, I'd have to trust you as a website.

# How does a website store a password?

Usually by creating a database table with format below.

```sql
CREATE TABLE User (
    Username varchar(64),
    Password varchar(64),
    Song     varchar(64)
);
```

`varchar` is the set of characters, in this case, of length 64. Then insert our credentials like

```sql
INSERT INTO User (Username, Password, Song)
VALUES ("Gustavo", "saf3", "You'll be in my heart");
```

Then you can retrieve the password with this query:

```sql
SELECT * FROM User;
+----------+----------+-------------------------+
| Username | Password | Song                    |
+----------+----------+-------------------------+
| Gustavo  | saf3     | "You'll be in my heart" |
+----------+----------+-------------------------+
```

And that's it. That's how a website stores your password. Thanks for reaching the end of the post, take care.

---

.

.

.

.

.

.

.

Yeah, there's more to it.

This method is how websites actually started storing passwords a few years ago, this is what is called **storing passwords in plain text**. We'll describe some flaws and start solving them.

## 1. Encrypt: We can *read* the password.

Why is this an issue? An attacker may access the database, retrieve the password and reuse it against other websites of the user like email or bank account.

**Solution:** Hash the password. Which means to not store the password, but a string generated out of it with a deterministic function.

*Deterministic?*, *function?*, *generated?*. Let get to it.

1. The name **function** is given to any mathematical procedure. `Sum` function adds 2 parameters so `Sum(2,3)` is the same as `2+3`. A function only needs a definition to exist: `Sum(x,y) = x + y`
2. Whenever you execute, do or run a function, you'll get a result. In `Sum(2,3)` the result is `5`. This result is **generated** from a function.
3. Our Sum function is **deterministic**, meaning it will always generate the same result given the same parameters. `Sum(2,3)` will always be `5`. But a function can retrieve different values with the same parameters. e.g. `getDate() = 2022 Nov 07 09:21:03`. With the same parameters (none) it will always return different values. Thus being Non-deterministic.

So a **hash** is the generated value of our function. Instead of storing `saf3`, we'll store the result of `h(saf3)`.

We'll define our `h(x)` function as [the caesars cipher][ccipher]. Briefly, it sets a cipher where any letter of the alphabet will get shifted according to a numeric key. So, if we work with a key of 1, a B would become an A. With a key of 2, a D would become a B. 

```
Key     3
Plain	A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
Cipher  X Y Z A B C D E F G H I J K L M N O P Q R S T U V W
```

We will only add a rule to this cipher to define `h(x)`: Ignore numbers.

Then, following the above key, our hash would be `h(saf3) = pxc3`.

We then go back to our database and run

```sql
INSERT INTO User (Username, Password, Song)
VALUES ("Gustavo", "pxc3", "You'll be in my heart");
```

Now, if an attacker gets database access and retrieves `pxc3`, they do not straight know that the original password was `saf3`.

And still, the user only needs to remember their original password. Every time they login, they input password `saf3` and the system will run the hash function to check a match between the stored password and the generated password.

```sh
Correct
userPass(Gustavo) == generatedPass(pxc3) --> saf3 == saf3

Incorrect
userPass(Gustavo) == generatedPass(wrong) --> saf3 != tolkd
```

At this point, websites used to send your password to your email if you forgot it.

## 2. Irreversible: We can *recover* the password

Caesars cipher may seem clever and useful. But any decent motivation will break this code. As shown in the Wikipedia article, we can decrypt the message by testing all 26 possible shifts (alphabet has 26 chars) and find it.

To render the password unrecoverable, we will need to apply an irreversible function to get a new hash. This will "destroy" the password. 

Let's create a new `irrev(x)` irreversible function for a safer hash. A few simple examples:

1. `irrev1(x)`: This hash will be the number of characters in the password. `irrev1(saf3) = 4`.
2. `irrev2(x)`: This function will convert any letter to a `1`, and any number to a `2`, and add the result string. e.g. `irrev2(saf3) = 1+1+1+2 = 5`
3. `irrev3(x)`: This function will convert any letter to a `3`, and any number to a `2`, and **multiply** the result string. e.g. `irrev3(saf3) = 3x3x3x2 = 54`

You can get creative with these irreversible functions. Let's select `irrev3(x)` to move on. We can store `54` as our user's password.

```sql
INSERT INTO User (Username, Password, Song)
VALUES ("Gustavo", "54", "You'll be in my heart");
```

At this point, websites cannot recover your password thus when you forget it, they offer to reset it but not recover it.

## 3. Collision: A password hash can easily match another one

Sure, we cannot straight recover `saf3` from the stored `54` password. However, we can trick the website into thinking we know the password. Simply:

1. Go to login
2. Input username `Gustavo`
3. Input password `4fun`
4. Get `access granted` message.

**Wait, why?** The system will calculate `irrev3(4fun) = 2x3x3x3 = 54`, and compare the password with our stored `54`.

Several passwords generating the same hash is possible and it's called a **collision**. Any irreversible function has these. However, our `irrev3(x)` is a weak hash function because it's very easy to find a collision, just any string with 3 letters and 1 number. Even if we keep our hash function definition a secret, attackers' software can test and access our platform by bruteforcing.

> [Brute force][bruteforce]: try out numerous [often random] password combinations

But there's no need to break our heads around designing a secure hash function as there are readily available functions we can borrow ([md5][], [sha1][], [sha256][]). These algorithms are designed to generate a fixed number of evenly distributed combinations across `+2^60` possibilities. We will use the Secure Hash Algorithm 1 ([sha1][]). 

```
2^60 = 2,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
                                                                   1 million --^
```

> You can generate your own SHA1 codes in duckduckgo search bar: [sha1(tryitnow)][tryhash]

Gustavo's new password will be `SHA1(saf3) = 194e371503f625b8f93aa34ccc50e9d4d37be4c3`. Let's insert it into our database

```sql
INSERT INTO User (Username, Password, Song)
VALUES ("Gustavo", "194e371503f625b8f93aa34ccc50e9d4d37be4c3", "You'll be in my heart");
```

## 4. Salt: What if the attacker can remember common passwords?

Of course human attackers don't have that kind of memory, but they can create a dictionary file (text file, basically). As sha1 is a deterministic algorithm, `SHA1(mypassword)` will always be `91dfd9ddb4198affc5c194cd8ce6d338fde470e2`, therefore a common dictionary will be:

```csv
password    key
----------+-----------------------------------------
1234        7110eda4d09e062aa5e4a390b0a572ac0d2c0220
mypassword  91dfd9ddb4198affc5c194cd8ce6d338fde470e2
password    5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8
fluffy      d9d71ab718931a89de1e986bc62f6c988ddc1813
john        a51dda7c7ff50b61eaea0444371f4a6a9301e501
```

If an attacker breaches any database of any website using SHA1 (or any common function) and gets their hands on hash `d9d71ab718931a89de1e986bc62f6c988ddc1813`, they can quickly check their dictionary and know that the password is `fluffy`. Then use this password and try it in every other website this user has created an account: fb, ig, google, banks, etc.

To avoid this attack method, we use a **salt**. A salt is a set of random characters, appended to the password before the hash function is applied.

Let's callback our `irrev3(x)` function. And define function `salted(x)` as a function that appends 3 random characters to the password `x` and executes `irrev3(x)` to the result: `salted(x) = irrev3(x + random(3))`. One example execution of `salted(saf3)` is:

```
salted(saf3) = irrev3(saf3 + random(3))
salted(saf3) = irrev3(saf3 + asd)
salted(saf3) = irrev3(saf3asd)
salted(saf3) = 2x2x2x3x2x2x2
salted(saf3) = 192
```

To store the salt, the User table is modified as:

```sql
CREATE TABLE User (
    Username varchar(64),
    Password varchar(64),
    Salt     varchar(64),
    Song     varchar(64)
);
```

And then store the password and salt

```sql
INSERT INTO User (Username, Password, Salt, Song)
VALUES ("Gustavo", "192", "asd", "You'll be in my heart");
```

If the password `saf3` were stored again, due to the salt being random, even if the attacker has a dictionary with `192 = saf3asd`, they would be unable to retrieve the correct password. And the hashed password would not match with another website hash.

---

Another example execution of `salted(saf3)`. This time, random salt is `15g`

```
salted(saf3) = irrev3(saf3 + random(3))
salted(saf3) = irrev3(saf3 + 15g)
salted(saf3) = irrev3(saf315g)
salted(saf3) = 2x2x2x3x3x3x2
salted(saf3) = 432
```

# Conclusion

Now you know there are incredibly safe ways to store passwords. Password security goes further than having a randomly generated password `6ZxpQ)Af-s90S7q`.

But still, do you know how does each website store your password? You don't. You should have strong passwords and use different ones for every account, just in case. More on how to do this in a later post.

[md5]: https://en.wikipedia.org/wiki/MD5
[sha1]: https://en.wikipedia.org/wiki/SHA-1
[sha256]: https://en.wikipedia.org/wiki/SHA-2
[ccipher]: https://en.wikipedia.org/wiki/Caesar_cipher
[tryhash]: https://duckduckgo.com/?q=sha1+tryitnow&t=brave&ia=answer
[bruteforce]: https://www.imperva.com/learn/application-security/brute-force-attack/