# dbt-unit-testing-examples

This repository contains examples of how to implement real unit tests for a dbt data application by using the [dbt-unit-testing](https://github.com/EqualExperts/dbt-unit-testing) package. You can also check the article I wrote on [how to get started with dbt and unit testing](https://medium.com/@pablo.porto/improving-the-code-quality-of-your-dbt-models-with-unit-tests-and-tdd-203ed0be791e).

## Features

- Unit test and mocking examples with the dbt-unit-testing package
- Component test examples with the dbt-unit-testing package
- Sources contract test examples with the dbt-expectations package
- Model contracts example with the dbt 1.5
- Data quality checks examples with the dbt-expectations and dbt test
- Katas to get started unit testing models

## Roadmap

- [x] ~Add unit test examples~
- [x] ~Add katas and improve README~
- [x] ~Add component test examples~
- [x] ~Add support for Github Codespaces~
- [ ] Add contract test examples
- [ ] Add data quality test examples

## Sample dbt app
Our sample dbt app is called health-insights. It takes weight and height data from upstream sources and calculates the metric body mass index. It follows the usual layered architecture commonly found in dbt projects.

![The layered architecture of a typical dbt data app](https://miro.medium.com/v2/resize:fit:2000/0*dvpk1nU-43Mz7nEn)

## Types of tests
The repository contains examples for both unit and component tests.

![The usual test pyramid for an operational app](https://miro.medium.com/v2/resize:fit:600/format:webp/1*5sbYcZw0v0sQv5oMddkp9Q.png)


## Katas

The repo contains two katas (small exercises) to learn how to implement unit tests for dbt models with the [dbt-unit-testing](https://github.com/EqualExperts/dbt-unit-testing) package:

- [Kata 1 - Adding support for imperial units](exercises/kata1.md) ([Solution](exercises/kata1-solution.md))
- [Kata 2 - Categorize body mass index (BMI) following WHO guidelines](exercises/kata1.md)

> A code kata is a software development exercise in which the focus is not on solving a task or problem, but on learning new skills and developing successful routines.

## Local setup

Install dbt following the [official documentation](https://docs.getdbt.com/docs/get-started/installation)

Spin up a Postgres database in a container

```
docker-compose up
```

Setup your dbt profile

```
cp profiles.example.yml profiles.yml
```

Install dbt dependencies

```
dbt deps
```

Check that everything works

```
dbt debug
```

Seed the database

```
dbt seed
```

## Running the tests

All tests

```
dbt test
```

Unit tests

```
dbt test --select tag:unit-test
```

Component tests

```
dbt test --select tag:component
```

Contract tests

```
dbt test --select tag:contract-test-source
```

## Running data quality tests

```
dbt test --select tag:data-quality
```
