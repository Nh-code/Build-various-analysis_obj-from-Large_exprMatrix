###################################################################
# File Name: 2.convert_adata.py
# Author: zhuzhiyong
# mail: zhuzhiyong@genomics.cn
# Created Time: Mon 18 Apr 2022 10:00:40 PM CST
#=============================================================
import os;import numpy as np;import pandas as pd;import joblib
import anndata as ad
import scipy.sparse as sp
from scipy.io import mmread
os.chdir(".")
#load matrix to bulid adata_obj
mtx = mmread('scRNA_matrix.mtx.gz')
mtx = mtx.T
mtx = sp.csr_matrix(X)
mtx.data = np.log2( mtx.data + 1 ) #convert to log normalization if needed
obs = pd.read_csv('scRNA_meta.tsv',sep = '\t')
var = pd.read_csv("scRNA_features.tsv", index_col=0,sep = '\t',header=None)
var.index.name = "gene_id"
ad_sc = ad.AnnData(X = mtx, obs = obs, var = var)
#save python object
os.chdir(".")
joblib.dump(ad_sc, 'ad_sc.pkl')
