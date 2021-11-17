# Testing

Tested using chef-workstation from Homebrew

# Unit specs

```
berks install --except integration
CHEF_LICENSE=accept-no-persist chef exec rspec
```

# Integration tests

Check [Test Kitchen](https://kitchen.ci/docs/getting-started/running-test).

- dokken/docker: `KITCHEN_LOCAL_YAML=kitchen.dokken.yml kitchen test`
- vagrant/virtualbox: `kitchen test`
