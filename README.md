<p align="center">
  <br>
  <img src="app/assets/images/logo.png" height="145">
  <h3 align="center">Deployed</h3>
  <p align="center">
    A tech themed social news and discussion website similar to Hacker News
  </p>
  <br>
</p>

## About

- Users can sign up for an account, create posts, and comment on topics to partake in discussion.
- Built with Ruby on Rails and PostgreSQL.
- Check out Deployed live on [Heroku](https://deployed-tech-news.herokuapp.com).

## API

News posts and comments are simply items and are identified by their unique ids (integer).<br>
All items have some of the following properties, with required properties in bold:

Field  | Description
------ | ------------------------------------------
**id** | The item's unique id.
type   | The type of item. One of "news", "comment"
by     | The username of the item's author.
text   | The news or comment text
url    | The source URL of the news
title  | The title of the news

### Endpoints

`/api/v0/item` - 25 newest items

- **Request type:** `GET`
- **Authentication:** None
- **Return status code:** 200 for OK, 400 for Errors

`/api/v0/item/<id>`

- **Request type:** `GET`
- **Authentication:** None
- **Return status code:** 200 for OK, 400 for Errors

`/api/v0/item/create`

- **Request Type:** POST
- **Request Body:**
```
  {
    "type" : "news",
    "source" : "https://github.com/joshjon",
    "username" : "josh",
    "text" : "Create a sample news"
  }
```
```
  {
    "type" : "comment",
    "news_id" : 1,
    "username" : "ethan",
    "text" : "Google is ramping up its efforts to make replace SMS with RCS"
  }
```
- **Authentication:** None
- **Return status code:** 200 for OK, 400 for Errors

### Example Responses

News: <https://deployed-tech-news.herokuapp.com/api/v0/item/22.json>

```
{
  "status": 200,
  "by": "indyzap",
  "id": 18,
  "title": "CamScanner, a malicious Android app with more than 100M downloads in Google Play",
  "url": "https://www.kaspersky.com/blog/camscanner-malicious-android-app/28156/",
  "time": 1567119696,
  "type": "News"
}
```

Comment: <https://deployed-tech-news.herokuapp.com/api/v0/item/25.json>

```
{
  "status": 200,
  "by": "tilbury",
  "id": 25,
  "text": "How did Google let this happen?",
  "time": 1567120017,
  "type": "Comment"
}
```

## Author

Joshua Jon<br>
GitHub: <https://github.com/joshjon>
