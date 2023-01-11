library(rjson)
library(data.table)

# instruction: go to https://developers.google.com/youtube/v3/docs/search/list?apix_params=%7B%22part%22%3A%5B%22snippet%22%5D%2C%22channelId%22%3A%22UCAxW1XT0iEJo0TYlRfn6rYQ%22%2C%22maxResults%22%3A5000%2C%22q%22%3A%22%5C%22senior%5C%22%22%2C%22type%22%3A%5B%22video%22%5D%2C%22videoDuration%22%3A%22any%22%7D
# in order to access the youtube api. 
# find the channel id by first searching for a channel
# then search for videos, copy text into a video.json file
# and extract urls. 

result <- fromJSON(file ="video.json")
names(result)

result <- result[["items"]]
names(result[[1]])

result[[1]][["id"]]
for (i in 1:length(result)) {
  result[[i]] <- paste0("https://www.youtube.com/watch?v=", result[[i]][["id"]][["videoId"]])
}


# prev <- fread("videos.csv", check)

rbind(result) |> t() |>
  as.data.table() |>
  # rbind(prev) |>
  fwrite("videos-raw.csv", col.names = FALSE)


# "channelId": "UCkWYei5MULuRDhH7uxtZqqA",
# "title": "SeniorShape Fitness"

# "channelId": "UC2BaKQ5vqal9yaC-VbpD5ZQ",
# "title": "Senior Fitness With Meredith",

# "channelId": "UCAxW1XT0iEJo0TYlRfn6rYQ",
# "title": "The Body Coach TV",