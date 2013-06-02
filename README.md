#Prosody [![Build Status](https://secure.travis-ci.org/gregf/cookbook-prosody.png)](http://travis-ci.org/gregf/cookbook-prosody)

##Description

Installs [Prosody](http://prosody.im) xmpp server.

##Requirements

Requires the [apt](http://community.opscode.com/cookbooks/apt)

###Platform

* Debian, Ubuntu

##Usage
#### prosody::default

e.g.
Just include `prosody` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[prosody]"
  ]
}
```

##Contributing

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

##License and Authors

Authors: Greg Fitzgerald <greg@gregf.org>
