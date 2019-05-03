## About the app
This app allows users to search for movie information through imdb API

## Struggles

### For this  movie app,I came across the following problems

#### 1 How to created a list of a tag inside erb file

#### Solution:
option 1 we could use the array in main.rb and join each element with the a tag surround it like

titles =[title1, title2]

str =''
titles.each do |title|
  str = str + "<a href="">#{title}</a>"

option 2 do it inside the erb file

whatever the ruby expression goes into the  <% %> and for @var don't forget the equal  <%= @var_name %>

#### 2 with the searching result link, I first pass in title to get the information, however, there are movies with exactly same title but in different years. the title is not unique 

#### solution: get imbID instead, this id is unique so you get diferent information with same title 


#### 3 URL encoder

I get stuck with redirect syntax the space inside a url for I accidentally put space inside the url which break the whole redirect method

#### Solution
It is always good to put url encoder for all url 


