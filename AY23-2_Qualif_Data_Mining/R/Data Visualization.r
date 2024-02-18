# Membaca data cari CSV
animeData <- read.csv("2. Data Visualization/anime.csv", fileEncoding = "UTF-8-BOM")

# Menghapus baris yang ada missing values
animeData <- na.omit(animeData)

# 1. Berdasarkan source
animeSource = animeData$source
tableSource <- table(animeSource)

# Visualisasi menggunakan pie chart
pie(
  tableSource, 
  main = "Anime grouped by source",
  labels = paste(names(tableSource), tableSource)
)

# 2. Berdasarkan status
animeStatus = animeData$status
tableStatus <- table(animeStatus)

pie(
  tableStatus, 
  main = "Anime grouped by status",
  labels = paste(names(tableStatus), tableStatus)
)

# 3. Berdasarkan type
animeType = animeData$type
tableType <- table(animeType)

pie(
  tableType,
  main = "Anime grouped by type",
  labels = paste(names(tableType), tableType)
)

# 4. Berdasarkan age rating
animeRating = animeData$rating
tableRating <- table(animeRating)

pie(
  tableRating,
  main = "Anime grouped by rating",
  labels = paste(names(tableRating), tableRating)
)

# 5. Berdasarkan aired from year
animeAiredFromYear = animeData$aired_from_year
tableAiredFromYear <- table(animeAiredFromYear)

plot (
  tableAiredFromYear,
  main = "Anime grouped by aired from year",
  type = "o",
  xlab = "Year",
  ylab = "Frequency"
)

