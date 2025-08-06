custom-field-shortcode
======================

custom-field-shortcode
----------------------

Contributors: Bruce Rafnel

Tags: plugin, shortcode, custom-fields

Requires at least: 6.0 ????

Tested up to: 6.2 ????

Stable tag: 1.0

License: GPLv2 or later

License URI: <http://www.gnu.org/licenses/gpl-2.0.html>

Description
-----------

Place custom fields anywhere in your post content.

Installation
------------

1.  Get the plugin zip file
2.  Use Add Plugins, Upload Plugin
3.  Activate the plugin

How do I use this plugin?
-------------------------

In your post\'s content add shortcode \"`custom_field`.\" In the
shortcode\'s field add:

> `[custom_field` field=\"your-custom-field-name\"\]

Replace \"your-custom-field-name\" with one of the custom field name
that are available to the post. To see the custom fields that are
available, select the \"...\" menu option Preferences, section General,
Advanced, turn on \"Custom fields\"

HTML can be put around the \[\] text and multip \[\] fields can be
added. For example:

> *=\[custom~field~= field=\"usp-custom-subtitle\"\]*
>
> by `[custom_field` field=\"usp-custom-author\"\]
>
> Link: [`[custom_field`
> field=\"usp-custom-link\"\]](%3Ccode%3E%5Bcustom_field%3C/code%3E%20field=%22usp-custom-link%22%5D)

How to uninstall the plugin?
----------------------------

Simply deactivate and delete the plugin.

Changelog
---------

### 1.0 {#section-1}

-   Plugin released.
