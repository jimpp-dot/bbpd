# OtaAssetBundle

OtaAssetBundle is a Flutter asset bundle that provides functionality for caching and updating assets from a remote server. It extends the `CachingAssetBundle` and allows for over-the-air (OTA) updates of assets.

## Features

- Loads and caches remote assets from a configurable domain.
- Supports differential updates by downloading only the changed assets.
- Provides a mechanism for downloading and updating assets in the background.
- Fallback to local assets if remote assets are unavailable.
- Configurable asset providers and update strategies.

## Usage

1. Create an instance of `OtaAssetBundle` with the desired configuration:

```dart
final otaAssetBundle = OtaAssetBundle(
  otaProviders: OtaAssetProviders(assetConfigProvider: FirebaseConfigProvider()),
  defaultOtaAssetDomain: 'https://example.com/assets',
  defaultOtaAssetDirPath: '/path/to/asset/directory',
);
```

2. Load the OTA manifest and initiate the asset update process:

```dart
await otaAssetBundle.loadLocalManifest();
otaAssetBundle.loadOtaManifest();
```

3. Access assets using the `load` method:

```dart
ByteData assetData = await otaAssetBundle.load('assets/images/logo.png');
```

The `load` method will first check if the requested asset is available in the OTA asset bundle. If not, it will attempt to load the asset from the local bundle or download it from the remote server.

## Configuration

The `OtaAssetBundle` can be configured with the following parameters:

- `otaProviders`: Provides the necessary providers for retrieving asset configuration, manifests, and downloading files.
- `defaultOtaAssetDomain`: The default domain URL for retrieving OTA assets.
- `defaultOtaAssetDirPath`: The default directory path for storing downloaded OTA assets.

## Providers

The `OtaAssetProviders` class is responsible for providing the necessary providers for asset configuration, manifests, and file downloads. It can be customized to fit your specific requirements.

