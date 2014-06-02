puma_service Cookbook
==============================
This cookbook will install Puma as a system service using the init scripts provided by Puma

Requirements
------------
This cookbook has only been tested on CentOS 6.5. Puma also ships with upstart scripts - if you would
like this support, please submit a pull request.

Attributes
----------
#### cookbook-puma-service::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><p style="font-family:'Lucida Console', monospace">['puma_service']['apps']</p></td>
    <td>Hash</td>
    <td>a hash containing configuration settings for each puma on the system</td>
    <td><p style="font-family:'Lucida Console', monospace">{}</p></td>
  </tr>
</table>

Usage
-----
#### cookbook-puma-service::default

1. Add a puma service to the apps hash

```ruby
"puma_service": {
  "apps": {
    "bacon_creator": {
      "app_path": "/path/to/my/bacon_creator",
      "user": "bacon_user",
      "config_file_path": "/path/to/my/bacon_creator/config/puma.rb",
      "log_file_path": "/path/to/my/bacon_creator/config/log/puma.log"
    }
  }
}
```

2. Include `puma_service` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[puma_service]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Case Taintor
