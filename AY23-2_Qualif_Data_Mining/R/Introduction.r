# Membaca data dari CSV
scoreData <- read.csv("1. Introduction/Score.csv", fileEncoding = "UTF-8-BOM")
scoreWeightData <- read.csv("1. Introduction/ScoreWeight.csv", fileEncoding = "UTF-8-BOM")

# Merge data score data dan score weight data
summary = merge(scoreData, scoreWeightData, by = "Course.Code")

# Mencari total score
summary$Total.Score <- round(
                                (summary$Assignment.x * summary$Assignment.y) +
                                (summary$Mid.Exam.x * summary$Mid.Exam.y) +
                                (summary$Final.Exam.x * summary$Final.Exam.y)
                            )

# Membuat function untuk mengembalikan grade
getGrade <- function(score){
  if(score >= 90 & score <= 100) 
    return ("A")
  else if(score >= 86 & score <= 90) 
    return ("A-")
  else if(score >= 81 & score <= 85) 
    return ("B+")
  else if(score >= 76 & score <= 80)
    return ("B")
  else if(score >= 71 & score <= 75)
    return ("B-")
  else if(score >= 66 & score <= 70)
    return ("C")
  else if(score >= 0 & score <= 65)
    return ("D")
}

# Menerapkan function getGrade di setiap elemen
summary$Grade = sapply(summary$Total.Score, getGrade)

# Membuat data frame
df <- data.frame(
                    Course.Code = summary$Course.Code,
                    Student.Name = summary$Student.Name,
                    Total.Score = summary$Total.Score,
                    Grade = summary$Grade
                 )

# Menyimpan hasil data frame ke dalam Result.csv
write.csv(df, "1. Introduction/Result.csv", row.names = TRUE)