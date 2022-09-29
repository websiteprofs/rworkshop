#!/usr/bin/env python
# coding: utf-8

# In[20]:


import numpy as np
import pandas as pd
from sklearn.impute import SimpleImputer
from sklearn import preprocessing


# In[6]:


car_insurance = pd.read_csv('C:/Users/GODFREY/Documents/Workshop/Python Workshop/Week 2/car insurance.csv')


# In[7]:


car_insurance


# In[8]:


car_insurance[['Age']]


# In[9]:


car_insurance.Age


# In[11]:


car_insurance.isnull().sum()


# In[12]:


numimputer = SimpleImputer(missing_values=np.nan, strategy='mean')
car_insurance[['Age', 'Mileage']]=numimputer.fit_transform(car_insurance[['Age', 'Mileage']])


# In[25]:


car_insurance


# In[28]:


catimputer = SimpleImputer(missing_values=np.nan, strategy='most_frequent')
car_insurance[['Fuel', 'Gearbox', 'Colour']]=catimputer.fit_transform(car_insurance[['Fuel', 'Gearbox', 'Colour']])


# In[19]:


car_insurance


# In[51]:


enc = preprocessing.OrdinalEncoder()
car_insurance[['Make', 'Fuel', 'Gearbox', 'Colour', 'Claimed']] = enc.fit_transform(car_insurance[['Make', 'Fuel', 'Gearbox', 'Colour', 'Claimed']])


# In[52]:


car_insurance


# In[ ]:




