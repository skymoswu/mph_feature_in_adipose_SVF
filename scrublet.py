#!/usr/bin/env python
# -*- coding: utf-8 -*-

import scrublet as scr
import pandas as pd
import os

samples = os.listdir("raw/")

for sample in samples:
    counts_mat = pd.read_table("raw/{}/counts.tsv".format(sample), sep = "\t", header = 0)
    scrub = scr.Scrublet(counts_mat)
    doublet_scores, predicted_doublets = scrub.scrub_doublets()
    doublet_scores.to_csv("raw/{}/doublet_score.csv".format(sample))
    predicted_doublets.to_csv("raw/{}/predicted_doublets.csv".format(sample))
