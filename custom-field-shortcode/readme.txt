custom-field-shortcode
======================

Contributors: Bruce Rafnel

Tags: plugin, shortcode, custom-fields

Requires at least: 6.0

Tested up to: 6.8.2

Stable tag: v1.1.2

License: GPLv2 or later

License URI: <http://www.gnu.org/licenses/gpl-2.0.html>

Description
-----------

Place custom fields anywhere in your post content.

Installation
------------

1. Get the custom-field-shortcode.zip file from
   https://moria.whyayh.com/rel/released/software/own/plugin-custom-field-shortcode/
2. Use Add Plugins, Upload Plugin, custom-field-shortcode.zip
3. Activate the plugin

How do I use this plugin?
-------------------------

In your post's content add shortcode "custom_field." In the
shortcode's field add:

> [custom_field field="your-custom-field-name"]

Replace "your-custom-field-name" with one of the custom field name
that are available to the post. To see the custom fields that are
available, select the "..." menu option Preferences, section General,
Advanced, turn on "Custom fields"

HTML can be put around the [] text and multiple [] fields can be
added. For example:

> <p>[custom~field field="usp-custom-subtitle"]</p>
>
> <p>by [custom_field field="usp-custom-author"]</p>
>
> <p>Link: [custom_field field="usp-custom-link"]>
> [custom_field field="usp-custom-link"]</p>

How to uninstall the plugin?
----------------------------

Simply deactivate and delete the plugin.

Changelog
---------

### 1.3.1

- Changed the version numbering

### 1.0

- First version
