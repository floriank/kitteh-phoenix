# Kitteh

This is a simple Phoenix project for demonstration purposes. It relates to the article series ["Using Phoenix with Docker"](https://floriank.github.io/post/using-phoenix-with-docker-part-1-introduction/). It's a simple image uploader that uses a PostgreSQL database for metadata about images and Phonix as web framework.

Please visit [my blog](https://floriank.github.io) for more articles. If you don't feel like that, you can still browse the code here and maybe create some pull requests to make it better.

## Instructions to run

To start your this app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
