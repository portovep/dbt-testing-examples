# dbt-testing-examples

[![CD Pipeline](https://github.com/portovep/dbt-testing-examples/actions/workflows/cd-pipeline.yml/badge.svg?branch=main)](https://github.com/portovep/dbt-testing-examples/actions/workflows/cd-pipeline.yml)

This repository contains examples of how to implement real unit tests for a dbt data application by using the [dbt-unit-testing](https://github.com/EqualExperts/dbt-unit-testing) package. You can also check the articles I wrote on testing data pipelines and data products with dbt

- [How to Improve The Code Quality of your Dbt Models with Unit Tests and TDD](https://medium.com/@pablo.porto/improving-the-code-quality-of-your-dbt-models-with-unit-tests-and-tdd-203ed0be791e).
- [A Complete Guide to Effectively Scale your Data Pipelines and Data Products with Contract Testing and dbt](https://medium.com/towards-data-science/how-to-scale-your-data-pipelines-and-data-products-with-dbt-and-contract-testing-10c92ea9a443).

## Features

- Unit test and mocking examples with the dbt-unit-testing package
- Katas to get started unit testing models
- Component test examples with the dbt-unit-testing package
- Sources contract test examples with the dbt-expectations package
- Model contracts example with dbt 1.5
- CI/CD pipeline example with Github Actions

## Roadmap

- [x] ~Add unit test examples~
- [x] ~Add katas and improve README~
- [x] ~Add component test examples~
- [x] ~Add support for Github Codespaces~
- [x] ~Add contract test examples~
- [ ] Add data quality test examples

## Sample dbt app

Our sample dbt app is called health-insights. It takes weight and height data from upstream sources and calculates the metric body mass index. It follows the usual layered architecture commonly found in dbt projects.

![The layered architecture of a typical dbt data app](https://miro.medium.com/v2/resize:fit:2000/0*dvpk1nU-43Mz7nEn)

## Types of tests

The repository contains examples for both unit and component tests.

![The usual test pyramid for an operational app](https://miro.medium.com/v2/resize:fit:800/format:webp/1*I6-e27kPOuJ9QaIgR9OwXw.png)

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
dbt test --select tag:unit-tests
```

Component tests

```
dbt test --select tag:component-test
```

Contract tests

```
dbt test --select tag:contract-test-source
```

## Running data quality tests (Coming soon)

```
dbt test --select tag:data-quality
```

## Setup data observability

Build Elementary models. It will create empty tables, that will be updated with artifacts, metrics and test results in future dbt executions.

```
dbt run --select elementary
```

Run the tests

```
dbt test
```

Generate data observability report

```
edr report
```
