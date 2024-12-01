#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from xml.etree import ElementTree

if __name__ == "__main__":
    print("-> Mangling configuration")
    file = os.environ.get("CONF_FILE", "/etc/ncs/ncs.conf")
    ns = {"": "http://tail-f.com/yang/tailf-ncs-config"}
    tree = ElementTree.ElementTree()
    tree.parse(file)
    root = tree.getroot()

    print("--> HTTP WebUI Server")
    root.find("./webui/transport/tcp/enabled", ns).text = "true"
    root.find("./webui/transport/tcp/port", ns).text = "8008"

    tree.write(file, default_namespace="http://tail-f.com/yang/tailf-ncs-config")
