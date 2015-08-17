# Cinemastar::Client

Cinemastar Client Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cinemastar-client', git: "https://github.com/naoto/cinemastar-client.git"
```

And then execute:

    $ bundle

## Configuration

Set envelopment.

- `cinemastar-host`
  - example: `export cinemastar_host=example.com`
- `cinemastar-user`
  - example: `export cinemastar_user=foo`
- `cinemastar-pass`
  - example: `export cinemastarr_pass=bar`

## Usage

- Search:
    
    ```ruby
    videos = Cinemastar::Client::API.find("title")
    videos.each { |video|
      video.title     #=> "title 01"
      video.path      #=> "http://example.com/video/title_01.m4v"
      video.thumbnail #=> "http://example.com/thumbnail/title_01.m4v.jpg"
      video.category #=> "title"
    }
    ```

- Title Search:

    ```ruby
    videos = Cinemastar::Client::API.title("title")
    videos.each { |video|
      video.title #=> "title 01"
      video.path  #=> "http://example.com/video/title/title_01.m4v"
      video.thumbnail #=> "http://example.com/thumbnail/title/title_01.m4v.jpg"
      video.category #=> "title"
    }

- Category:
    
    ```ruby
    videos = Cinemastar::Client::API.category("Anime")
    videos.each { |video|
      video.title #=> "title 01"
      video.path  #=> "http://example.com/video/title_01.m4v"
      video.thumbnail #=> "http://example.com/thumbnail/title_01.m4v.jpg"
      video.category #=> "title"
    }
    ```

- Latest:
    
    ```ruby
    videos = Cinemastar::Client::API.latest
    videos.each { |video|
      video.title #=> "title 01"
      video.path  #=> "http://example.com/video/title_01.m4v"
      video.thumbnail #=> "http://example.com/thumbnail/title_01.m4v.jpg"
      video.category #=> "title"
    }
    ```

