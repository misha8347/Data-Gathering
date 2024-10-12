import pandas as pd

#https://leetcode.com/problems/capital-gainloss/
def capital_gainloss(stocks: pd.DataFrame) -> pd.DataFrame:
    stocks['gain'] = stocks.apply(lambda row: row['price'] * -1 if row['operation'] == 'Buy' else row['price'], axis=1) 
    value_counts = stocks[['stock_name', 'gain']].groupby('stock_name')['gain'].sum()
    return value_counts.reset_index().rename(columns={'gain': 'capital_gain_loss'})
