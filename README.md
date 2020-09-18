# Objectives #


## gamification ##
noun
> gam·​i·​fi·​ca·​tion | \ ˌgā-mə-fə-ˈkā-shən

> the process of adding games or gamelike elements to something (such as a task) so as to encourage participation
> <cite>[Mirriam-Webster dictionary](https://www.merriam-webster.com/dictionary/gamification)</cite>


## gamify ##
transitive verb, **gamified**; **gamifying**; **gamifies**
> gā-​mə-​ˌfī

> Easy-to-use Web- and mobile-based learning platforms … take the boredom out of long training sessions by gamifying the entire process. A training manual is replaced by an interactive game that allows participants to win awards and be acknowledged.
> <cite>J. J. Rosen</cite>



The definition of these words provides the focus for this project; to make the internal process of staff feedback and recognition fun, involving, possibly competitive and even addictive.

# API #

gamify is an API service with the following endpoints.

## GET /api/scores

This endpoint returns current scores based in a given scope and challenge. GET
parameters are privided in the usual way:

- challenge (required) the short name of the challenge
- scope (required) the scope of the aggregated query: company, team or userid
- company - filter by company
- team - filter by specified team
- userid - filter for specific user

Examples:

```
  /api/scores?challenge=timesheets&scope=team&company=unico&team=hi-fliers

  /api/scores?challenge=timesheet&scope=company&company=unico
```
