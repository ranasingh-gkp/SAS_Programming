import os
import pickle
import pandas as pd
os.chdir(r"\\vmgursrv0423\Ops\Rana\Input\Older")


df = pd.read_csv('CLIENT_SEP19.csv')
pd.to_pickle(df, 'CLIENT_SEPT19.pkl')

BRANCH_SEP19 = pd.read_csv('BRANCH_SEP19.csv')
pd.to_pickle(df, 'BRANCH_SEP19.pkl')

AGENT_SEP19 = pd.read_csv('AGENT_SEP19.csv')
pd.to_pickle(df, 'AGENT_SEP19.pkl')





