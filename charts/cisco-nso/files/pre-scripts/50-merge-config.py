#!/usr/bin/env python
# -*- coding: utf-8 -*-

import glob
import os
from xml.etree import ElementTree


class XMLConfigMerger:
    """
    Merge XML files for NSO configuration
    """

    def __init__(self, conf_file: str):
        self.file = conf_file
        self.tree = ElementTree.ElementTree()
        self.tree.parse(self.file)
        self.root = self.tree.getroot()
        self.roots = []

    def load(self) -> None:
        conf_dir = os.path.dirname(self.file)
        files = glob.glob(f"{conf_dir}/ncs.conf.d/*.xml")
        for xml_file in files:
            print(f"--> {xml_file}")
            self.roots.append(ElementTree.parse(xml_file).getroot())

    def write(self) -> None:
        self.tree.write(
            self.file, default_namespace="http://tail-f.com/yang/tailf-ncs-config"
        )

    def combine(self) -> None:
        for root in self.roots:
            self._combine_element(self.root, root)

    def _combine_element(self, one, other) -> None:
        """
        This function recursively updates either the text or the children
        of an element if another element is found in `one`, or adds it
        from `other` if not found.
        """
        mapping = {el.tag: el for el in one}
        for el in other:
            if len(el) == 0:
                try:
                    mapping[el.tag].text = el.text
                except KeyError:
                    mapping[el.tag] = el
                    one.append(el)
            else:
                try:
                    self._combine_element(mapping[el.tag], el)
                except KeyError:
                    mapping[el.tag] = el
                    one.append(el)


if __name__ == "__main__":
    print("-> Merging configuration")
    r = XMLConfigMerger(os.environ.get("CONF_FILE", "/etc/ncs/ncs.conf"))
    r.load()
    r.combine()
    r.write()
