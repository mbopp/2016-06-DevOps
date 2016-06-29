# hello_world-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hello_world']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### hello_world::default

Include `hello_world` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[hello_world::default]"
  ]
}
```

## License and Authors

Author:: SpinDance, Inc. (<davidr@spindance.com>)
