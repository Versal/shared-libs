# CDN Shims

Here's some commonly-used JavaScript libraries, and appropriate AMD shims. This
will help us avoid the need to either a) bundle common dependencies with each
gadget, or b) load them all globally in the player.

## Contents
<table>
  <tr>
    <th>Library</th><th>Version</th><th>Shim Name</th>
  </tr>
  <tr>
    <td>Backbone</td>
    <td>1.0.0</td>
    <td>cdn.backbone</td>
  </tr>
  <tr>
    <td>Backbone.Marionette</td>
    <td>1.0.2</td>
    <td>cdn.marionette</td>
  </tr>
  <tr>
    <td>jQuery</td>
    <td>1.9.1</td>
    <td>cdn.jquery</td>
  </tr>
  <tr>
    <td>Lodash</td>
    <td>1.1.1</td>
    <td>cdn.lodash</td>
  </tr>
  <tr>
    <td>Processing.js</td>
    <td>1.4.1</td>
    <td>cdn.processing</td>
  </tr>
  <tr>
    <td>Raphaël</td>
    <td>2.1.0</td>
    <td>cdn.raphael</td>
  </tr>
  <tr>
    <td>Underscore</td>
    <td>1.4.4</td>
    <td>cdn.underscore</td>
  </tr>
</table>

## Usage
    git submodule add git://github.com/Versal/cdn-shims.git cdn
    <script src='cdn/config'></script>

## Todo
- Host these on a real CDN.
- Become a require plugin (`cdn!*` rather than `cdn.*`)
