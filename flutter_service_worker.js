'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/android-icon-48x48.png": "15da80b118c618ead6da253363387351",
"icons/favicon-16x16.png": "45bd400c0fa8959d7acdecf5495e728d",
"icons/android-icon-144x144.png": "f922d03014168c85d0dd6edbc60b5aaa",
"icons/apple-icon-57x57.png": "452c13acaa785de4177bab582c2baec3",
"icons/ms-icon-144x144.png": "f922d03014168c85d0dd6edbc60b5aaa",
"icons/apple-icon-60x60.png": "ddd463da4e0d49eb36fc93c7256c4b8b",
"icons/android-icon-36x36.png": "fab92be66856a4234a7a040957469029",
"icons/apple-icon-120x120.png": "ecf389b5313efde6869fff5f2e41ae6e",
"icons/browserconfig.xml": "97775b1fd3b6e6c13fc719c2c7dd0ffe",
"icons/android-icon-96x96.png": "9f716aac81eb6602e405df2a23742692",
"icons/favicon-32x32.png": "524d4391c4c798ba121af46e75141bc5",
"icons/favicon-96x96.png": "9f716aac81eb6602e405df2a23742692",
"icons/ms-icon-310x310.png": "e5fb153ae3413a55108d87c056f790f3",
"icons/android-icon-192x192.png": "ff49fc7bc92025430f399565e74f3281",
"icons/apple-icon-76x76.png": "c69e4a5ef7709716c68b04ee3f7d1a42",
"icons/apple-icon-152x152.png": "09af67777c16a99a64c6bc347931dc50",
"icons/apple-icon.png": "bda03f53d88799e52a199b248ca5d930",
"icons/apple-icon-114x114.png": "08b95199aed402dadeb8594e557562c5",
"icons/ms-icon-150x150.png": "6c4ce0b33a3104eb03627a1ee06874ac",
"icons/apple-icon-precomposed.png": "bda03f53d88799e52a199b248ca5d930",
"icons/android-icon-72x72.png": "18026b31e85d7c6bcf87fdee418823a6",
"icons/ms-icon-70x70.png": "b988c6a0eeeb420af474950505ffaf0c",
"icons/favicon.ico": "99094bdaf1d991aedea89f9138b161bb",
"icons/apple-icon-144x144.png": "f922d03014168c85d0dd6edbc60b5aaa",
"icons/apple-icon-72x72.png": "18026b31e85d7c6bcf87fdee418823a6",
"icons/apple-icon-180x180.png": "6e299a6e0f46623f0d3235800ece3bb0",
"icons/manifest.json": "751ddeeb27da4af50607bde7bc30c2b7",
"logo.gif": "5d3d72e3b1e542873d66ca0b66baa33a",
"index.html": "b862be88f4d04adbaae4b2d1cb33d8b8",
"/": "b862be88f4d04adbaae4b2d1cb33d8b8",
"main.dart.js": "06d98bf4e42f6a61253987cfd024abfe",
"version.json": "75fbb00fefd85c90fd03f16eaf2becd3",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "b20dfb8cd3e9657a56b93ff299016760",
"assets/fakes/fake_home.png": "6f45874644710df2288e59ac7b4e03be",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "4334cf4ff1fefd7a4828fab1fac3a10d",
"manifest.json": "122a95c41e8ef5e464e14e4dd60d796f"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
