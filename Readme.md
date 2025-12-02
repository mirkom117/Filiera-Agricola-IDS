- [Progetto Ingegneria Del Software](#progetto-ingegneria-del-software)
- [Struttura](#struttura)
  - [Progetto Java](#progetto-java)
  - [Progetto Spring Boot](#progetto-spring-boot)

# Progetto Ingegneria Del Software

# Struttura

All'interno del repository ci sono due percorsi:

- `.\FilieraAgricola\FilieraAgricola`
- `.\FilieraAgricola\FilieraAgricolaSpring`

Che contengono una prima bozza java del progetto e la versione definitiva Spring.

Vedere inoltre i readme dedicati a:

- [File Visual Paradigm](./FilieraAgricola/Documentation/Vpp/ids%20progetto.vpp)
- [Postman](./FilieraAgricola/FilieraAgricolaSpring/postman/readme.md)

Per una prova più corposa attraverso un db completo usare i file sql `.\FilieraAgricola\FilieraAgricolaSpring\sample-db-dump`

## Progetto Java

Il progetto java è stato inizialmente progettato, con l'ausilio di questi pattern

- **Strategy**: Lo strategy è usato per la selezione delle operazioni svolte dal sistema.
- **Decorator**: Il decorator è stato usato per la gestione delle autorizzazioni.
- **Prototype**: Il prototype gestisce la generazioni della tipologia degli **attori**.
- **Bridge**: Il bridge è usato implicitamente nel pattern decorator, ad esempio, dove anziche usare una **classe astratta** si usa la composizione **classe interfaccia**.
- **Singleton**: Il singleton è stato usato per avere un' unica istanza del sistema generale.
- **Facade**

In oltre il progetto segue un'architettura basata sul pattern MVC

## Progetto Spring Boot

Nel passare a spring boot alcuni pattern sono stati "assorbiti" nell'applicazione di alcuni **componenti** spring specifici.

- Abbiamo mantenuto la **logica comportamentale** del modello all'interno di opportuni `@Service`.
- Il pattern **strategy** risulta "assorbito" dall'uso dei `@RestController` che restano ben separati come controller dal modello che è nei `@Service`.
- Il **bridge** esiste ancora quando nei service andiamo a fare l'`@AutoWired` sui repository, che sono interfacce.
- La configurazione dei prototipi del **prototype** avviene attraverso una opportuna `@Configuration`
