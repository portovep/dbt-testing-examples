Welcome to your new dbt project!

## Local setup

Spin up a postgres container

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

### Running the tests

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

### Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
