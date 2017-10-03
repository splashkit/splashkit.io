# How to Write A SplashKit Guide

This tutorial will cover the details of how to write a SplashKit guide for the SplashKit website.

Tools needed:

  1. A GitHub account.
  2. Ruby development environment (for building the SplashKit website).
  3. An awesome idea for a guide.

## Getting Ready
1. In order to test your guide in the SplashKit website, you need to download the source code for the website. To do this, make sure you are logged into GitHub, and then [create a fork](https://help.github.com/articles/fork-a-repo/) of the SplashKit io repository on GitHub. Visit the [SplashKit.io Github](https://github.com/splashkit/splashkit.io) link and select `fork` on the top right.

2. [Clone your fork](https://help.github.com/articles/cloning-a-repository/) by selecting `clone or download`, copying the link and cloning it to your computer. You can do this via git on the terminal, or using GitHub Desktop.

3. Check the `README.md` of the cloned SplashKit website to ensure you have the correct version of the Ruby tools installed.

## Writing The Guide.
1. In the project, locate the directory `source/guides/code-examples` and determine if you need to create a new directory for your guide. If you do, create the directory and name it appropriately, and make sure you create a file `index.html.erb` for that directory, using the template below (ensuring you replace [category] with your directories new name).

    ```erb
    <h3>[category] Guides</h3>
    <div class="list-group">
      <% find_guides_in_category('code-examples/[category]').each do |f| %>
        <a class="list-group-item" href="/<%= f[:uri] %>"><%= f[:doc_title] %></a>
      <% end %>
    </div>
    ```

2. Create a file in the format `title.html.md` and add the following `meta` tags to the top of the file:

    ```html
    <meta name="guide-title" content="Awesome JSON guide" />
    <meta name="api-link-groups" content="json" />
    <meta name="api-link-functions" content="create_json,create_json_from_string,json_set_string,json_set_number,free_json" />
    ```

    Typically, the value of the `api-link-groups` should be the category in which the guide is in.

    The `api-link-functions` should contain a comma seperated list of all of the functions used within the guide.

    The above is an example for a guide named "Awesome JSON guide", which will appear in the `json` group, attached to a list of related `json` functions.

    Make sure you link your guide to the appropriate api groups and functions.

    <div class="alert alert-warning">
      Note: these tags are not rendered in the guide, they are used for parsing the api documentation.
    </div>

3. Write your guide! Remember to keep the language friendly, include examples and ensure it is high quality. All guides should be written in [Markdown](https://guides.github.com/features/mastering-markdown/).


## Test the guide.
Time to make sure everything looks right. Run `bundle exec middleman` and visit localhost to see the website. Naviate to the guides to *hopefully* see your awesome guide. Make sure it all looks good. Also ensure that all links to the API were successful by visiting the relevant api section.

## Merging your guides into the SplashKit website
If it's all looking good, it's time to submit a `pull request` so that a member of the SplashKit team can view your proposed guide and get it published!

To do this, push your changes via GitHub, and visit the GitHub webiste for your fork. View this [GitHub tutorial](https://help.github.com/articles/creating-a-pull-request/) for more details on how to do this. A member of the SplashKit team will view your guide, give feedback, and otherwise make sure everything looks good. Finally, they will then publish your guide!

SplashKit is completely open source, and free to use - so any contributions to the project are appreciated!

If at any stage of this process you run into any issues, feel free to contact Jake at `jake.renzella@deakin.edu.au`
