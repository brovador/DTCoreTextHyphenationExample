DTCoreTextHyphenationExample
============================

An example of creating justified and hyphenated text with DTCoreText. Tested over iOS5+.

![Example](http://brovador.github.io/DTCoreTextHyphenationExample/hyphens-example.png)

NSString+Hyphenation
--------------------

Simple <code>NSString</code> category that hyphenates his text using a selected locale.

<pre>
- (NSString*)hyphenatedStringWithLocale:(NSLocale*)locale;
</pre>


