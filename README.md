# Twina Docker image

This image is based on the Ubuntu (bionic) image and contains binaries from
several tools developed in the [Vertics
group](https://www.laas.fr/public/en/vertics):

* [twina](https://projects.laas.fr/twina/): a tool for analyzing the “product”
  of two Time Petri nets with inhibitor and read arcs.
* [sift](http://projects.laas.fr/tina/): a specialized version of tina
  supporting on the fly verification of reachability properties for Time Petri
  nets. Sift offers less options than tina but is typically faster and requires
  considerably less space.
* [ktzio](http://projects.laas.fr/tina/manuals/ktzio.html): a conversion tool
  for transition systems that can generates _ktz_ files from the output of
  twina.
* [selt](http://projects.laas.fr/tina/manuals/selt.html): a State/Event-LTL
  model checker.

This image also contains script files and models that can be used to [reproduce
results](https://projects.laas.fr/twina/post/reproducibility/) from our
benchmarks.

The download size of this image is:
[![](https://images.microbadger.com/badges/image/vertics/twina.svg)](https://microbadger.com/images/vertics/twina)

## Usage Example

This image is intended to be used for testing Twina; you can find instructions
on how to install the tool [here](https://projects.laas.fr/twina/#download). To
reproduce the results in our [\[Formats19\]](#ref1) paper on example
``jdeds.net`` you can simply run the following command:

```sh
$ docker run  --rm vertics/twina ./twinaluate.sh jdeds f
jdeds,plain,LSCG,21,42,0.001,SSCG,28,45,0.002
jdeds,twin,LSCG,489,1144,0.004,SSCG,706,1432,0.011
jdeds,obs,LSCG,49,103,0.001,SSCG,64,115,0.001
```

You can also start an interactive bash session to try the tools, for instance by
reproducing the experiments with the diagnosability of patterns described in
[this post](https://projects.laas.fr/twina/post/benchmark_patterns/).

```sh
$ docker run --rm -it vertics/twina  bash
root@55c69b04edf3:~# twina transport.tpn
904 classe(s), 820 marking(s), 142 domain(s), 1947 transition(s)
0.023s
```

## Reference

> <b id="ref1">\[Formats19\]</b> Lubat É, Dal Zilio S, Le Botlan D, Pencolé Y,
  Subias A. [A State Class Construction for Computing the Intersection of Time
  Petri Nets Languages](https://hal.laas.fr/hal-02263832). In _17th
  International Conference on Formal Modeling and Analysis of Timed Systems_
  (FORMATS) 2019, LNCS Vol. 11750. Springer. (hal-02263832))

## Dependencies

The vertics/twina image contains a copy of the [LTL2BA
software](http://www.lsv.fr/~gastin/ltl2ba/) written by Denis Oddoux and
modified by Paul Gastin. This program is used by selt.
