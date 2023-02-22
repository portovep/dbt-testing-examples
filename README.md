# dbt-unit-testing-examples

This repository contains examples of how to implement real unit tests for a dbt data application by using the [dbt-unit-testing](https://github.com/EqualExperts/dbt-unit-testing) package.

## Katas

The repo contains two katas (small exercises) to learn how to do unit testing of dbt models by practicing:

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
