# native-plugin-sync-demo

This demo demonstrates how to sync up native plugin code for Apache Cordova. The `demo-app` uses the `echo-plugin` as well as a custom version of `phonegap-plugin-contentsync`.

## Commands


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

