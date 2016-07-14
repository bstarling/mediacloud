#!/usr/bin/env python

import argparse

from mc_solr.constants import *
from mc_solr.solr import run_solr_shard

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Install Solr and start a shard.",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    shard_group = parser.add_mutually_exclusive_group(required=True)

    # Shard number for humans (1, 2, 3, ...)
    shard_group.add_argument("-n", "--shard_num", type=int, help="Shard number (starts with 1).")

    # Shard index for Supervisor (0, 1, 2, ...)
    shard_group.add_argument("-i", "--shard_index", type=int, help="Shard index (starts with 0).")

    parser.add_argument("-c", "--shard_count", type=int, required=True, help="Number of shards.")
    parser.add_argument("-zh", "--zookeeper_host", type=str, required=False, default=MC_SOLR_CLUSTER_ZOOKEEPER_HOST,
                        help="ZooKeeper host to connect to.")
    parser.add_argument("-zp", "--zookeeper_port", type=int, required=False, default=MC_SOLR_CLUSTER_ZOOKEEPER_PORT,
                        help="ZooKeeper port to connect to.")
    parser.add_argument("-mx", "--jvm_heap_size", type=str, required=False, default=MC_SOLR_CLUSTER_JVM_HEAP_SIZE,
                        help="JVM heap size (-Xmx).")

    args = parser.parse_args()

    shard_num = args.shard_num
    if shard_num is None:
        shard_num = args.shard_index + 1

    run_solr_shard(shard_num=shard_num,
                   shard_count=args.shard_count,
                   zookeeper_host=args.zookeeper_host,
                   zookeeper_port=args.zookeeper_port,
                   jvm_heap_size=args.jvm_heap_size)
