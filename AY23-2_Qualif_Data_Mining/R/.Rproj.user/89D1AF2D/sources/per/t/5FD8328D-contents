# Install packages
install.packages("arules")
library("arules")

# Membaca data dari CSV
headerData <- read.csv("3. Data Description and Frequent Pattern Analysis/header.csv", fileEncoding = "UTF-8-BOM")
detailData <- read.csv("3. Data Description and Frequent Pattern Analysis/detail.csv", fileEncoding = "UTF-8-BOM")
itemData <- read.csv("3. Data Description and Frequent Pattern Analysis/items.csv", fileEncoding = "UTF-8-BOM")

# Menghapus baris yang ada missing values
headerData <- na.omit(headerData)
detailData <- na.omit(detailData)
itemData <- na.omit(itemData)

# Merge data
transactionData <- merge(headerData, detailData, by.x = 'header_id', by.y = "transaction_id")
transactionData <- merge(transactionData, itemData, by.x = "item_id", by.y = "id")
transactionData <- split(transactionData$name, transactionData$header_id)

rules <- apriori(
  transactionData, 
  parameter = list
  (
    support = 0.05, 
    target = 'frequent itemset'
  )
)
inspect(rules)

associationRules <- ruleInduction(rules, confidence = 0.5)
inspect(associationRules)