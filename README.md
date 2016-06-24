# source-preview-pug package

[source-preview](https://atom.io/packages/source-preview) provider for [Pug](https://github.com/pugjs/pug) (formerly Jade).

[![Gyazo](http://i.gyazo.com/e9be65838fad5d98f930f2f23acdf588.gif)](http://gyazo.com/e9be65838fad5d98f930f2f23acdf588)

## Requirement

* [source-preview](https://atom.io/packages/source-preview)

## Atom Settings

Modify your `config.cson` to support rendering templates that use locals.

`config.cson`
```cson
"source-preview-pug":
    useDefaultLocals: true
    defaultLocals:
        localValue: "Test"
```

`template.jade`
```jade
p The local is: #{localValue}.
```

`compiled.html`
```html
<p>The local is: Test</p>
```

The package [`local-settings`](https://atom.io/packages/local-settings) can help by providing project-level configuration settings for your atom editor.
