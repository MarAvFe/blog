---
title: "10 Pasos para Proteger sus Cuentas en Línea"
pubDate: 2026-08-05
tags: ['ciberseguridad', 'seguridad-personal', 'privacidad', 'guías']
description: "Una guía práctica de dos horas para asegurar sus cuentas personales: gestor de contraseñas, doble factor y los hábitos que de verdad detienen un ataque."
---

Si usted está leyendo esto, hay altas probabilidades de que tenga una cuenta bancaria en línea, un correo electrónico principal y más de veinte cuentas repartidas entre servicios de internet. Probablemente nunca se ha sentado a revisarlas todas.

Esta guía toma alrededor de dos horas y está pensada para hacerse una sola vez, de principio a fin y en orden. No necesita conocimientos técnicos. Al terminar, su seguridad va a estar muy por encima del promedio, y el resto depende de unos pocos hábitos que también se explican aquí.

No hay tal cosa como riesgo cero. Lo que sí existe es sumar capas hasta que atacarlo a usted deje de valer la pena.

## Resumen

1. Cambiar la contraseña del correo electrónico. AHORA.
2. Crear una cuenta en Bitwarden.
3. Hacer el inventario de sus cuentas.
4. Habilitar el doble factor (2FA) en sus cuentas bancarias.
5. Cambiar las contraseñas de riesgo alto.
6. Cambiar las contraseñas de riesgo medio.
7. Limpiar las contraseñas guardadas en el navegador.
8. Nunca iniciar sesión desde un enlace.
9. Aprender a leer la dirección del sitio.
10. Mantenerse alerta.

---

## 1. Cambie la contraseña del correo electrónico. AHORA

La contraseña del correo es la más sensible de todas, por cuatro razones:

1. **Es su usuario en casi todo.** Plataformas de video, sistemas gubernamentales, servicios en la nube, notificaciones oficiales.
2. **Es el método de recuperación de todo lo demás.** Quien controla su correo puede pedir el cambio de contraseña de cualquier otro servicio y recibirlo ahí mismo.
3. **Almacena información delicada.** Facturas, contratos, documentos escaneados, conversaciones privadas.
4. **Almacena su historial de comportamiento.** Un atacante que lea su bandeja aprende sus gustos, sus horarios y con quién se comunica. Eso es materia prima para engañarlo después.

Es cierto que las plataformas grandes de correo tienen varias capas de seguridad. Pero la contraseña es la primera y la única que depende enteramente de usted.

### ¿Cómo crear una contraseña segura?

Un generador produce cosas como `f1#06e426412bae7e07ab*f94e`. Es excelente y es imposible de recordar, lo cual la vuelve poco práctica para las dos o tres contraseñas que usted sí necesita tener en la cabeza.

Para esas, use el **Método 3, 2, 1**:

- **3** palabras
- **2** números
- **1** carácter especial

Por ejemplo:

- `laBrujaVerde83#`
- `viendoTristesCorceles29!`

Tres palabras se recuerdan con facilidad, igual que la posición de las mayúsculas. Los números y el carácter especial aumentan la entropía, es decir, la cantidad de combinaciones que un atacante tendría que probar.

Estire las palabras y los números todo lo que quiera: más largo es siempre más seguro. Y evite a toda costa datos personales — el nombre de su mascota, el de un familiar, su fecha de nacimiento. Esa información está en sus redes sociales y es lo primero que se prueba.

> **Sobre los límites de caracteres.** Buena parte de los bancos costarricenses limitan la contraseña a doce o dieciséis caracteres, prohíben símbolos o solo aceptan números. Cuando eso pase, use el máximo que le permitan y compense con el doble factor del paso 4. No es culpa suya; es una limitación de ellos.

---

## 2. Cree su cuenta en Bitwarden

### ¿Qué es un gestor de contraseñas?

Es un bloc de notas cifrado. Si su contraseña fuera `password123` y le diera miedo olvidarla, quizá la anotaría en un papel pegado al escritorio o en las notas del teléfono. Hay muchos escenarios en los que ese papel termina en las manos equivocadas, y las notas del teléfono son peores: cualquiera que tome el aparato desbloqueado las lee de un vistazo.

Un gestor de contraseñas sella esa información detrás de tantas capas de cifrado que extraerla por la fuerza tomaría miles de años. Pero con la contraseña maestra correcta, el acceso es inmediato.

### ¿Por qué Bitwarden?

Es gratuito, funciona en todas las plataformas, es de código abierto — cualquiera puede auditarlo — y en el celular se abre con la huella digital. Alternativas razonables son 1Password, Proton Pass y Keeper. Cualquiera de ellos es mejor que anotar contraseñas en el teléfono.

### La contraseña maestra

Esta sí hay que memorizarla. Bitwarden ofrece métodos de recuperación de emergencia, pero el riesgo de anotar ese código y perderlo ocho años después es demasiado alto. Es la única contraseña que no puede olvidar.

Extienda el Método 3, 2, 1 a **5 palabras, 5 números y 5 caracteres**. Una forma cómoda es separar las palabras con un carácter repetido:

`11las$Vacas$Cantan$Con$Frecuencia789`

Cuesta las primeras veces y después sale sola. [Este artículo en inglés](https://vext.info/2019/03/25/practical-password-guidance.html) explica distintos niveles de dificultad al construir contraseñas; vale la lectura.

<!-- Punto de inserción sugerido para la subsección de passkeys / llaves de acceso -->

### Déjelo a mano

Instale la extensión en su navegador y la aplicación en su teléfono. Si va a usarlo, tiene que estar accesible en todo momento; de lo contrario volverá a los viejos hábitos en la primera semana.

A partir de aquí, la única contraseña que usted escribe de memoria es la de Bitwarden. Todas las demás se copian y se pegan.

---

## 3. Haga su inventario de cuentas

No hace falta reconstruir su vida digital de memoria. Su navegador ya tiene esa lista.

1. Abra Bitwarden y busque la opción **Importar datos**.
2. Elija su navegador (Chrome, Edge, Safari, Firefox) y siga las instrucciones para exportar desde ahí e importar acá.
3. En cinco minutos va a tener una lista de cuentas que probablemente había olvidado.

Ahora clasifíquelas. En Bitwarden puede usar carpetas, o hacerlo en una hoja de cálculo si prefiere:

| Cuenta               | Riesgo |
|----------------------|--------|
| correo electrónico   | Alto   |
| banco principal      | Alto   |
| streaming de música  | Medio  |

Apunte a veinte cuentas o más. Va a llegar sin esfuerzo.

### ¿Qué riesgo tiene cada una?

Este es el momento de pensar en el peor escenario. Alguien entró a esa cuenta: ¿qué es lo peor que puede pasar?

- **El banco.** ¿Se llevan todos sus ahorros, o su dinero está en instrumentos (CDP) que no se mueven tan rápido? ¿Pero pueden ver el número de su tarjeta y comprar en línea en menos de cinco minutos?
- **Una plataforma de streaming.** ¿Le cancelan el servicio? ¿Reutilizan su tarjeta? ¿Es una plataforma seria o tiene malas prácticas de seguridad? No lo sabemos. Asuma lo peor.
- **El correo del trabajo.** Tal vez no guarda nada sensible, pero con él inicia sesión en un servicio en la nube donde el atacante podría contratar infraestructura por dos mil dólares. ¿Es mucho o poco para usted? ¿Le costaría su empleo?
- **Una plataforma gubernamental.** ¿Le cancelan la licencia de conducir y recuperarla le toma dos semanas de trámites? Ese riesgo es alto aunque no se mida en plata.

No todo se reduce a dinero. El tiempo y la reputación también se pierden.

---

## 4. Habilite el doble factor en sus cuentas bancarias

**2FA** significa *Two Factor Authentication*, autenticación de dos factores. Consiste en identificarlo con dos elementos: algo que usted **sabe** — la contraseña — y algo que usted **tiene** — su teléfono.

El efecto práctico es que su contraseña, por sí sola, deja de servirle a un atacante.

### No todos los métodos son iguales

1. **Aplicación de autenticación (lo mejor).** Google Authenticator, Aegis o el propio Bitwarden. Escanean un código QR una vez y luego generan un código nuevo cada sesenta segundos. No necesitan internet ni señal: funcionan por algoritmo.
2. **Notificación en la aplicación del banco (bien).** Es lo que ofrecen la mayoría de los bancos nacionales y es perfectamente válido.
3. **Mensaje SMS (aceptable, pero el más débil).** Existe un ataque llamado *SIM swap* en el que alguien convence a su operador telefónico de pasar su número a otro chip. A partir de ahí, sus códigos llegan al teléfono del atacante.

La regla es simple: **si la plataforma le ofrece aplicación y SMS, elija la aplicación.** Si solo ofrece SMS, actívelo igual — es muchísimo mejor que nada.

### Nunca comparta su código

> **Ningún banco, ninguna empresa y ninguna institución le va a pedir su código de un solo uso. Nunca. Por ninguna vía.**

Quien lo llame diciendo que es del banco y necesita ese código para "verificar su identidad" o "cancelar una transacción sospechosa" está robándole en ese momento. Cuelgue y llame usted al número que aparece en su tarjeta.

Lo mismo aplica a los códigos de SINPE Móvil y a cualquier código que le llegue sin que usted lo haya pedido. Un código que usted no solicitó significa que alguien ya tiene su contraseña.

### ¿Y si pierdo el teléfono?

Al activar el 2FA, casi todas las plataformas le muestran una lista de **códigos de recuperación de un solo uso**. Guárdelos. El lugar correcto es una nota segura dentro de Bitwarden, que ya está cifrada y sincronizada.

---

## 5. Cambie las contraseñas de riesgo alto

Vuelva a la lista del paso 3 y recorra las cuentas de riesgo alto, una por una. Este ejercicio cumple tres funciones:

- Renueva claves viejas que pueden llevar años expuestas.
- Deja cada cuenta guardada correctamente en Bitwarden.
- Le permite habilitar el doble factor de una vez, en la misma visita.

Es un paso metódico y algo largo. Son de riesgo alto por una razón.

### Y aquí se acaba la repetición de contraseñas

Si usted usa la misma contraseña en dos sitios, la seguridad de ambos es igual a la del más descuidado de los dos. Cuando a una tienda cualquiera le roban su base de datos, los atacantes toman esos correos y contraseñas y los prueban automáticamente en bancos, correos y redes sociales. Se llama *credential stuffing* y es la forma más común en que la gente normal pierde sus cuentas.

Ahora que tiene Bitwarden, ya no hay ninguna razón para repetir: cada cuenta lleva una contraseña distinta y usted no necesita recordar ninguna. Use el generador de Bitwarden para todas — es el botón de los dados — y déjelo en veinte caracteres o más.

---

## 6. Cambie las contraseñas de riesgo medio

El mismo procedimiento del paso anterior, con el resto de las cuentas. Aquí el doble factor es opcional; la prioridad es que cada contraseña sea distinta y esté guardada en Bitwarden.

Con esto termina la parte de construcción. Lo que sigue son hábitos.

---

## 7. Limpie las contraseñas guardadas en el navegador

Ya las importó a Bitwarden en el paso 3, así que ahora sobran donde estaban.

1. Entre a la configuración de contraseñas de su navegador.
2. Elimine las guardadas.
3. **Desactive el guardado automático** para que no vuelvan a acumularse.

El almacén del navegador es cómodo pero débil: en varios navegadores basta el desbloqueo del sistema para ver todas sus contraseñas en texto legible. Cualquiera que tome su computadora desbloqueada por diez segundos se lleva su vida entera.

No cambie eso por el minuto que le ahorra no abrir Bitwarden.

---

## 8. Nunca inicie sesión desde un enlace

Este es el hábito más importante de toda la guía.

Los enlaces son convenientes y por eso son el vehículo favorito de los ataques. Un correo que parece de su banco, un mensaje que parece de Correos de Costa Rica pidiendo pagar un impuesto de aduana, una notificación que parece de su plataforma de streaming diciendo que su pago falló. Todos lo llevan a una página que se ve idéntica a la real y le piden su usuario y su contraseña.

**La regla:** si un mensaje le pide iniciar sesión, no use el enlace del mensaje. Cierre el mensaje, abra la aplicación oficial o escriba usted mismo la dirección del sitio. Si el aviso era real, ahí va a estar esperándolo.

### La ventana privada, para lo demás

Cuando reciba un enlace de procedencia dudosa y quiera ver de qué se trata, ábralo en una ventana privada o de incógnito:

1. Clic derecho sobre el enlace, **Copiar dirección**.
2. En su navegador, abra una **ventana privada** o de **incógnito**.
3. Pegue la dirección ahí.

La ventana privada no comparte las sesiones que usted tiene abiertas. Eso significa que la página no puede aprovechar su sesión de correo o de redes sociales para ejecutar acciones a su nombre ni leer datos de esas cuentas.

Sea claro sobre lo que *no* hace: no lo vuelve anónimo, no bloquea programas maliciosos y no lo protege si usted escribe su contraseña ahí. Es una capa adicional, no un escudo.

---

## 9. Aprenda a leer la dirección del sitio

Mucha gente cree que el candado del navegador significa que el sitio es legítimo. No lo significa.

**El candado solo indica que la conexión va cifrada**, es decir, que nadie en el camino puede leer lo que usted envía. La inmensa mayoría de los sitios de phishing tienen su candado en orden, porque el certificado que lo produce es gratuito y se obtiene en dos minutos.

Lo que sí dice la verdad es la dirección. Léala con calma, y fíjese en las **dos últimas palabras antes de la primera barra**:

- `www.bancobcr.com/login` → el dominio es **bancobcr.com**. Correcto.
- `www.bancobcr.seguro-cr.com/login` → el dominio es **seguro-cr.com**. Falso, aunque diga "bancobcr" al inicio.
- `www.bancobcr-cr.com/login` → el dominio es **bancobcr-cr.com**. Otro sitio distinto.

Un guion, una letra de más o una palabra pegada al inicio son suficientes. Cuando tenga duda, no adivine: entre por la aplicación del banco o por un marcador que usted mismo haya guardado.

> **Sobre las redes.** Para operaciones bancarias en un lugar público, prefiera los datos móviles de su celular sobre el wifi abierto del café. No es la defensa principal — el cifrado moderno hace bastante bien su trabajo — pero es gratis y elimina a un actor del panorama.

---

## 10. Manténgase alerta: usted es el eslabón más débil

Las matemáticas ganaron esta discusión. Hoy existen algoritmos rápidos, confiables y auditables para cifrar datos, y aplicarlos bien es barato. El viejo truco de "adivinar" la contraseña se acabó, al menos para quien siga esta guía.

Por eso los atacantes se movieron hacia lo que sí sigue funcionando: **engañar a las personas**. Es lo que se llama ingeniería social, y el phishing — el formulario falso que imita al real — es apenas su forma más común. También están la llamada urgente del supuesto banco, el mensaje del familiar que perdió el teléfono y necesita un SINPE, la oferta de trabajo con un archivo adjunto.

Todos comparten la misma firma: **crean urgencia para que usted no piense**. Cuando algo lo apure, esa prisa es el ataque. Cuelgue, cierre, respire y verifique por un canal que usted haya elegido.

Si quiere entender por qué estos engaños funcionan incluso con gente que "ya lo sabe", lea [Por Qué Caemos: Cómo Funcionan Realmente los Ataques](/blog/2026-08-05-por-que-caemos).

Cada dos o tres meses, dedique diez minutos a:

- Revisar el reporte de filtraciones de Bitwarden y cambiar lo que aparezca ahí.
- Confirmar que el correo y el teléfono de recuperación de sus cuentas principales siguen siendo suyos.
- Cerrar sesiones activas que no reconozca.

**¿Ya le pasó?** Si sospecha que alguien ya entró a una de sus cuentas, deje esta guía y vaya directo a [Ya Me Hackearon: Qué Hacer Ahora](/blog/2026-08-05-ya-me-hackearon).

---

## Corramos la voz

Todos tenemos algo que no podemos permitirnos perder digitalmente. De estas medidas se beneficia igual quien tiene veinte mil colones en su cuenta que quien tiene veinte millones.

Y solemos pagar indirectamente cuando un familiar o un amigo cae en un fraude. Que la gente a su alrededor esté protegida también es de su interés.

Si esta guía le sirvió, compártala.

**¿Va a asistir a una manifestación?** Esta guía es la base, pero una protesta tiene riesgos propios. Lea [Voy a una Protesta: Guía de Seguridad Práctica](/blog/2026-08-05-voy-a-protesta-guia-seguridad-practica) o, si tiene poco tiempo, la [Lista Rápida](/blog/2026-08-05-voy-a-protesta-lista-rapida).

---
