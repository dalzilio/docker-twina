Twina Docker image
=================

This image is based on the Ubuntu (bionic) image and contains binaries from two
tools developed in the [Vertics group](https://www.laas.fr/public/en/vertics):

* [sift](http://projects.laas.fr/tina/): a specialized version of tina
  supporting on the fly verification of reachability properties for Time Petri
  nets. Sift offers less options than tina but is typically faster and requires
  considerably less space.
* [twina](https://projects.laas.fr/twina/): a tool for analyzing the “product”
  of two Time Petri nets with inhibitor and read arcs.

This image also contains script files and models that can be used to [reproduce
results](https://projects.laas.fr/twina/post/reproducibility/) from our
benchmarks.

The download size of this image is:
[![](https://images.microbadger.com/badges/image/vertics/twina.svg)](https://microbadger.com/images/vertics/twina
"Get your own image badge on microbadger.com")

Usage Example
-------------

This image is intended to be used for testing Twina; you can find instructions
on how to install the tool [here](https://projects.laas.fr/twina/#download). To
reproduce the results in our paper on example ``jdeds.net`` you can simply run
the following command:

```sh
docker run  vertics/twina ./twinaluate.sh jdeds f
```
