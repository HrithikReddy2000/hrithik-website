'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0d021d4e06ff195fa92a72820000ffcf",
"version.json": "c4a3f3633059f2a8bcf4132619d22217",
"index.html": "573f2fe8e5d617992247248815420fe8",
"/": "573f2fe8e5d617992247248815420fe8",
"main.dart.js": "ae4634236c9086a61b1e0155eda85d92",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2ffd41002956de6382c3f5c88b3359c4",
".git/config": "e8d678ac95d097be4029983add5e8ee2",
".git/objects/61/bb740a15a98ceed3a03cf356f3308afceaa4f9": "2edfe2cae062d744a60dfd7211ee5720",
".git/objects/3e/591243c7d599570dc3fa07eda49e06a39c6c45": "23269ef6dfa864c67d550e73d3bce407",
".git/objects/68/afa07d7e69aed9cd97a219cdcd26f733f1ba7f": "0c1785303e882ec0f818fb68811cc253",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/58/31840272dc1c691085a1cda9eff0467b035365": "adfbc6c173c4e9b037c82eb43ea9b9d0",
".git/objects/67/0f88141713a0687f39a30eb911c5ab16b2a1ac": "d21922c1ed1accce8853e35d127c7919",
".git/objects/94/57f89b0c7d2bdff3f5363279c4b2220978747e": "f232111f23247155296c8a4b0c2ef412",
".git/objects/0e/80456d44bd4f72ea2d749985fd6ea34a7caf5f": "c78edcb2a79481200aa8bb83cfbc423d",
".git/objects/9d/ab1f58293ac4cdc85ac82994af640e6681cbe5": "80a9275f458a58fcd6ca98c519ead7a4",
".git/objects/d1/a48b5f3500a921299382542e236d7889e8bae9": "e9ce2d4de904fa24b58453ee105d5738",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/17dbad30a5e340ad3d57a53f06f1af554a7568": "120d4b3a11d7bc5e1d9c6cbc006caa7f",
".git/objects/f4/c3a80cf5b6e72e07b3e73d4bd59f89735a7afd": "efdf7590dc1304595ef1681b4dccbc4f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/60c31d757fe737019256568edbc6eddf406c96": "767f495969d260de50dae101f6de76af",
".git/objects/c7/5d49d408e47d0b52a3b6d5fa815cd03ffd657b": "3a268f5ab84a8773c4e9fa0fae1d05b4",
".git/objects/fc/670d19e6e092a6aaa54a55eee38b010849b592": "db30ba7b07ab1aaa8d98491333de54a7",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/73/58ec6adc45195fe2fbcc959fb30637f8323d53": "cd273799a50bf062c738025bb61c6be7",
".git/objects/28/84c45e977b0fc243021ddd9029e0db8fefdbb0": "87d15ac4c1eb6642aaf59527b05af4bd",
".git/objects/7b/c279c76747a11ee0769318cfd471d0ff9f2144": "30bab598308f4aebf60917c3a105221c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/21/4215a03b2343798e31d9cbcc9d8029380a11ad": "b0486f433d29368a047e2605d1a4d154",
".git/objects/2f/5cc8a5666866cabe32f29ca881cb0d62bf49bd": "efc2c4346f61190dfbaa3b3cf7556de8",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/07/5fe9b2ec545328cefb746f38af251c76598e7f": "0259c152da7821689a82c5215715e04c",
".git/objects/38/03ad0beca7bdfb4b4349872bba98e982f9882d": "359339f6ffbd271786b12cf87ad695e7",
".git/objects/9a/54a12e07518d774d1aec7f8994c2ac75cc147f": "62e5b19dc0e38064163a0f5de7638115",
".git/objects/5d/a9bf0f961d4ffa33ecee4d491cb79a88ff9d78": "ea48b3025afda28c35219e613d6267ff",
".git/objects/31/edfe0161ac7c9117968bc771793148e630f501": "fcc5d3924928b9eb3261fa4aeafc0a80",
".git/objects/53/dcfe84c8b392bcb3148194fa0e89fbf1d469bb": "f1732c80c8a961c18ae9a6b03abb9265",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/01/2e11a49ffc20c7d0484d3eeabaea065ffcd6fc": "1e0439d901a39b3c27f085db298dfc10",
".git/objects/99/8f3d9b652e3e6a09e1deb847917d30c7425067": "b12efc9faab63b59c5c931296ed17d2a",
".git/objects/0a/9036d852aa699772de52fb1375648d98a078d4": "3df7bae148306e25cab827ddc204a7af",
".git/objects/d3/79541570045040e0b565f952a11daff77c5f60": "970976f942fb0bc39932aac490d1b238",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/a0/5476ee26fdbdf740ccb1656404cb6c3411917c": "ae55aac8b63794fe6a6896c6b7952562",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/a9/6407a835954cb95145f13615ec7fc071ee7c61": "319fea9a620132282c3a4598283842f1",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/6f703084d17020859a78f48b1175cc0d672a94": "efb2d3f99c30fff1f13ae08e6c33b7a5",
".git/objects/a6/0bcb3878418d9d03b36632f0fc36f1c0d537b8": "0bec84e72782473d7cfd7e24c7feadcc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/c3/2a071382fe08e19eaf54d8734b12adf37e746c": "d5e83afabec7405f7f93f4e87d59788f",
".git/objects/e1/7ccb1c34e1455bf615294dc0509afa05983386": "74294090e31c4b5f6ab96a70dd123c91",
".git/objects/f7/8dd0e73050fea65173f5b3176c1d58c97ffc20": "a491c3e84f56635d72257efd0ab5c62f",
".git/objects/c2/de2acec1324290949b2241c8c14a01b1913091": "5b0c52a514133f5d5dd0063460f063a0",
".git/objects/e0/ac544338bb620d7f74cc339882a3fec27216fc": "4ef1c620935afd80aa68e4984144efd3",
".git/objects/48/37533a8ffb636e111644446b8b5254d152a146": "54ab11d80a5332cf91fd2999264849ea",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/24/e82f8620e106d4eaa031f410da7af81f39ebb8": "e9c5cbcb43cdc6606e710125ecbe3a31",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/12/080dddcd510902c735c70333a9a85c0790a7f9": "206dd58161663d028962329297627f01",
".git/objects/12/133bb37fc806646c7994b7f2f4224b5580e9fd": "64f055f63998d2b0c1f0fa1fa1d1b81a",
".git/objects/82/09f77036655d8ecf486cdd18a05782e2e620e2": "9b6cad28330df1623ec7051c0aaa1b13",
".git/objects/13/54e642b83d359713f16371acd16b268637f627": "02ff23f84c4177d3a5bb9df77826ac31",
".git/objects/8e/cb1b27889f2203b748cbbd1baba8b24b23e2f6": "a6ab1fce4df66aec89449f2e505446dc",
".git/objects/25/f21d6b83c3a99c0fd077d8de6c7af2b413a94d": "6e3bf0a1c4a838fb609c1223ca0e61ce",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "0aebccfd5866bfc3e7c8f625230c22f7",
".git/logs/HEAD": "c5339fb6fd4b681e31cd43fc23fbf3e7",
".git/logs/refs/heads/main": "ea2f8ca08e54362857692e550e903072",
".git/logs/refs/remotes/origin/main": "6bd3c14da64586eda80722c72336a317",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "01b1688f97f94776baae85d77b06048b",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/refs/heads/main": "4e0cdb14bf4b995f5c4911cdce9955fc",
".git/refs/remotes/origin/main": "4e0cdb14bf4b995f5c4911cdce9955fc",
".git/index": "b3add5c31e551c659490196285faa2cc",
".git/packed-refs": "a891e6bb26eb0d480aef486a7e8ea166",
".git/COMMIT_EDITMSG": "7e79545094a63ee9095996927233cdfe",
"assets/AssetManifest.json": "e974049ea0615d686c74b1cf48d5407f",
"assets/NOTICES": "aa43cfd023c05086c3038aee31fa1f16",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "d9332b2bce92f98efb2be1660ccf0ea7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "86b36cedc72428a9577e5327aa30508a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "41e8302cbaf04408585d948a435f4421",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "64fcfb4f3a1ff7d4616805bf4855e4ca",
"assets/fonts/MaterialIcons-Regular.otf": "3bc6be03e4ab04ab490a30d6eb726868",
"assets/assets/images/ecclogo.jpeg": "7cc4ef2c143c4826c26b95a3a8c10cfe",
"assets/assets/images/ontop.png": "f72cf730d76f6c8505843fc022f40012",
"assets/assets/images/logo1.png": "1ee13e9b993b8bd557c3f508fd59866a",
"assets/assets/images/griet.png": "530be867a1f29843474561f69b87261e",
"assets/assets/images/myimage.jpeg": "380a69338b512caa443220e730079363",
"assets/assets/images/myportfolio.png": "8fd47aa499b4736a86c2f1577835c2d2",
"assets/assets/animations/resume.pdf": "a606a849685c3db1bb5cb5a42d821c42",
"assets/assets/animations/mobile_app_development.riv": "582ae3fc85ec9c582daa4bddaa8386e2",
"assets/assets/animations/mobile_app_development_dark.riv": "05719b228ff0260b96c826ddb253dfa0",
"assets/assets/animations/mobile_app_development_trans.riv": "607e59b2555a23f704dd6d5da710f31b",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
