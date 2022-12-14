# Advanced Analytics for Web Accelerator

This accelerator guides the user through setting up Snowplow tracking in web apps.
It also introduces the Snowplow dbt web data model.

## Installation

Recursively update the git submodules:

```sh
git submodule update --init --recursive
```

To build the Hugo app:

```sh
./scripts/build.sh build
```

## Usage

To start an HTTP server serving the app, use:

```sh
./scripts/build.sh serve
```

This will run `hugo server` on the background.