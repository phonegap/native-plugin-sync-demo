# native-plugin-sync-demo

This demo demonstrates how to sync up native plugin code for Apache Cordova. The `demo-app` uses the `echo-plugin` as well as a custom version of `phonegap-plugin-contentsync`.

## Commands

    npm run deploy

Builds the necessary `demo-app` and deploys it to your attached iOS device. The terminal will log messages to the `lldb` debugger; enter `safequit` to terminate.

---


    npm run build

Builds both the `demo-app` (for a device) and the `echo-plugin` (.cdvplugin framework).
Note that this will use the `iPhone Developer` certificate by default -- if you have more than one, the echo-plugin and demo app may not be signed by the same certificate. Verify by running `npm run codesign-info`

---

    npm run package

Packages the `demo-app/www` folder and the `echo.cdvplugin` plugin into a file `package.zip` in the root

---

    npm run codesign-info

Shows the codesigning info for both the `demo-app` and the `echo-plugin`. All these have to be equal for the demo to work:

1. `Format` has to be any or all of armv7 and arm64
2. All `Authority` fields have to be equal
3. `Identifier` has to be equal
4. `TeamIdentifier` has to be equal

Explicitly re-sign your `echo-plugin` if it doesn't match to the appropriate certificate identity. For example:

        codesign -f -s "iPhone Developer: John Doe (2GL212LIGU)" echo-plugin/build/echo.cdvplugin

To find a codesigning identity, either copy it from the output to match your `demo-app`, or run `npm run codesign-identities` below.

---

    npm run codesign-identities

Run this to see all the codesigning identities available on your machine.
  
--- 
  
    npm run httpserver

Runs a simple http server for the demo at port 8080.

Grab the first line with the IP address and port, and modify this line in [www/js/index.js](https://github.com/phonegap/native-plugin-sync-demo/blob/361242fdbb9253f265578fec17762c71d843a901/demo-app/www/js/index.js#L32) -- replace that variable's value with your value.


## Updating a Plugin

In `echo-plugin/echo-plugin/build.xcconfig`, add a value for `PLUGIN_NAMESPACE`. The plugin needs to have a new name, if not it will not be loaded properly due to a symbol conflict. For example, you could add a version:

    PLUGIN_NAMESPACE = v1_0_0

This will in turn change the name of the class from `EchoPlugin` to `v1_0_0EchoPlugin`

Once you do that, you can run `npm run package` to package your plugin for syncing, and run `npm run httpserver` to serve it.