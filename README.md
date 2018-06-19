# Founded Rails

A pre-built content management system for your [founded x](http://foundedx.com) site. Effortlessly deploy to heroku below, [email us](mailto:hello@alternatelabs.co?subject=Help%20setting%20up%20founded-rails) if you need any setup assistance.

## Prerequesites

Before you can deploy you need to setup a typeform, this allows startups to join your network. Follow the guide below and then you can deploy to heroku using a 1-click install.

1. You’ll first need to create a [Typeform](http://www.typeform.com/) account.

2. Setup a form with the following questions and field types (you can use different wording for the answers):

    | Field type | Question                       |
    | ---------- |:------------------------------:|
    | Short text | What’s your startup called?    |
    | Number     | What year was it founded?      |
    | Short text | Where are you based?           |
    | Long text  | What does your startup do?     |
    | Website    | What is your website?          |
    | Short text | What is your twitter username? |
    | Website    | URL of your logo               |
    | Short text | And your name is?              |
    | Email      | And your email address?        |
    | Long text  | Anything else you want to add? |

3. Setting up field mapping

    This is the most complicated part of the setup, open your typeform clicking the **View** link in the header.

    View the source of your typeform e.g. view-source:https://foundedinireland1.typeform.com/to/yI1dff and search for `fields`, here you’ll find a mapping between the questions and their typeform IDs. E.g.

    ```
    "fields":[{"id":"bp2PAMt5DapV","title":"What’s your startup called?","ref":"4df38107-dea3-491b-9505-c606474da3e8","validations":{"required":false},"type":"short_text"}
    ```

    In this instance the question is `What’s your startup called?`, the ID is `bp2PAMt5DapV` and the database column is `name`. Your ID will be different and if you used different wording for the questions they will be different too.

    You want to build a mapping of ID to database column, here are the database columns we have mapped to questions.

    | Database Column | Question                       |
    | --------------- |:------------------------------:|
    | name            | What’s your startup called?    |
    | year_founded    | What year was it founded?      |
    | location        | Where are you based?           |
    | description     | What does your startup do?     |
    | url             | What is your website?          |
    | twitter         | What is your twitter username? |
    | logo_url        | URL of your logo               |
    | contact_name    | And your name is?              |
    | contact_email   | And your email address?        |
    | extra_info      | Anything else you want to add? |

    So using the question title you find in the source of your form, take each ID and replace it below pointing to the appropriate database column.

    ```
    {"bp2PAMt5DapV":"name","Av0UXopCYUdj":"year_founded","FNOCWDDXiWnM":"location","DfgMjFJccVLN":"description","qIJf9xi70ZP5":"url","umMRGv2QZTuj":"twitter","qTFmXYLSEbPL":"logo_url","d1vBKmaB8ahg":"contact_name","LOk5rkEgVaAM":"contact_email","O6e59hlEzZuc":"extra_info"}
    ```

    When deploying to heroku set this mapping as the value for the `TYPEFORM_FIELD_IDS_TO_NAMES` key.

4. Take note of your form URL by clicking the **View** button in the top navigation and copying the URL, it should look like:

    https://your-username.typeform.com/to/your-form-id

    Use this for the `TYPEFORM_URL` property when deploying

5. Take your form ID from the username above, it is the last segment of the URL, usually 5-8 characaters long. Use this for the `TYPEFORM_UID` property when deploying.

6. In **My Account** (click your initials in the top right corner) create a personal access token and use it for the `TYPEFORM_ACCESS_TOKEN` property when deploying.

Using the information above you can now deploy. [Please contact us](mailto:hello@alternatelabs.co?subject=Help%20setting%20up%20founded-rails) if you run into any problems or require additional features or help setting up.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/openhq/openhq)

## Running the app in development

Ensure you have the correct ruby version (check .ruby-version) and [PostgreSQL](http://postgresapp.com/) installed.

```sh
# Installs required gems, setups up database and creates .env enviornment file from sample
$ bin/setup
```

## MIT License

Copyright (c) 2015 Alternate Labs Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
