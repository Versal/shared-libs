# Shared libs

Here's some commonly-used JavaScript libraries, and appropriate AMD shims. Also
includes a little script for injecting these semi-delicately into existing
require.js configs.

## Contents
<table>
  <tr>
    <th>Library</th><th>Version</th><th>Shim Name</th><th>Aliases</th>
  </tr>
  <tr>
    <td>Backbone</td>
    <td>1.0.0</td>
    <td>cdn.backbone</td>
  </tr>
  <tr>
    <td>Backbone.Marionette</td>
    <td>1.1.0</td>
    <td>cdn.marionette</td>
  </tr>
  <tr>
    <td>jQuery</td>
    <td>1.10.2</td>
    <td>cdn.jquery</td>
  </tr>
  <tr>
    <td>Processing.js</td>
    <td>1.4.1</td>
    <td>cdn.processing</td>
  </tr>
  <tr>
    <td>Raphaël</td>
    <td>2.1.2</td>
    <td>cdn.raphael</td>
  </tr>
  <tr>
    <td>Underscore</td>
    <td>1.5.2</td>
    <td>cdn.underscore</td>
    <td>cdn.lodash</td>
  </tr>
  <tr>
    <td>Underscore.mixins</td>
    <td>1</td>
    <td>cdn.underscore.mixins</td>
  </tr>
  <tr>
    <td>Hogan</td>
    <td>2.0.0</td>
    <td>cdn.hogan</td>
    <td>cdn.mustache</td>
  </tr>
  <tr>
    <td>jQuery UI</td>
    <td>1.9.2</td>
    <td>cdn.jqueryui</td>
  </tr>
</table>

## Usage

1. Install shared libs with npm
2. Connect `node_modules/lib/` as `/scripts/lib` to your website
3. Use lib/config.js to set up requirejs paths and shims for shared-libs
