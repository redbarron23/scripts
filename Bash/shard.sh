#!/bin/bash
export SHARD1="205.166.181.5 205.166.181.6 205.166.181.7"
export SHARD2="205.166.181.8 205.166.181.9 205.166.181.10 205.166.181.14"
export SHARD3="205.166.181.11 205.166.181.12 205.166.181.13"
export SHARD4="205.166.181.15 205.166.181.16 205.166.181.17"
export SHARD5="205.166.181.18 205.166.181.19 205.166.181.20"
export SHARD6="205.166.181.21 205.166.181.22 205.166.181.23"

echo "========= SHARD 1 ============"
for host in ${SHARD1}; do
echo "Host: ${host}"
/usr/bin/ssh -t jhourihane@${host} $1
done

echo "========= SHARD 2 ============"
for host in ${SHARD2}; do
echo "Host: ${host}"
ssh  -t jhourihane@${host} $1
done

echo "========= SHARD 3 ============"
for host in ${SHARD3}; do
echo "Host: ${host}"
ssh  -t jhourihane@${host} $1
done

echo "========= SHARD 4 ============"
for host in ${SHARD4}; do
echo "Host: ${host}"
ssh  -t jhourihane@${host} $1
done

echo "========= SHARD 5 ============"
for host in ${SHARD5}; do
echo "Host: ${host}"
ssh  -t jhourihane@${host} $1
done

echo "========= SHARD 6 ============"
for host in ${SHARD6}; do
echo "Host: ${host}"
ssh  -t jhourihane@${host} $1
done
