import Foundation

struct Templates {
    static let head = """
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Racurated</title>
  <meta name="description" content="A curated list of ReactiveSwift / ReactiveCocoa projects powered by Swift and ReactiveSwift.">

  <link rel="stylesheet" href="https://raccommunity.github.io/racurated/css/main.css">
</head>
"""

    static let header = """
<header id="top" class="site-header">

  <div class="wrapper">

    <a class="site-title" href="{{ site.baseurl }}/">{{ site.title }}</a>

    <nav class="site-nav">
      <a href="#top" class="menu-icon">
        <svg viewBox="0 0 18 15">
          <path fill="#424242" d="M18,1.484c0,0.82-0.665,1.484-1.484,1.484H1.484C0.665,2.969,0,2.304,0,1.484l0,0C0,0.665,0.665,0,1.484,0 h15.031C17.335,0,18,0.665,18,1.484L18,1.484z"/>
          <path fill="#424242" d="M18,7.516C18,8.335,17.335,9,16.516,9H1.484C0.665,9,0,8.335,0,7.516l0,0c0-0.82,0.665-1.484,1.484-1.484 h15.031C17.335,6.031,18,6.696,18,7.516L18,7.516z"/>
          <path fill="#424242" d="M18,13.516C18,14.335,17.335,15,16.516,15H1.484C0.665,15,0,14.335,0,13.516l0,0 c0-0.82,0.665-1.484,1.484-1.484h15.031C17.335,12.031,18,12.696,18,13.516L18,13.516z"/>
        </svg>
      </a>

      <div class="trigger">
        <a class="page-link" href="https://github.com/RACCommunity/racurated">Contribute</a>
      </div>
    </nav>

  </div>

</header>
"""

    static let footer = """
<footer class="site-footer">
  <div class="wrapper">
    Curated by the <a href="https://github.com/RACCommunity/racurated/graphs/contributors">ReactiveCocoa community</a>.
  </div>

</footer>
"""

    static let projects = """
<!DOCTYPE html>
<html>

  {% include "head.html" %}

  <body>

    {% include "header.html" %}

    <div class="page-content">
      <div class="wrapper">
        {% for project in projects %}
            {% include "project.html" %}
        {% endfor %}
      </div>
    </div>

    {% include "footer.html" %}
  </body>

</html>
"""

    static let project = """
<div class="project {{ project.kind }}">
    <h1>
        <a href="{{ project.url }}">{{ project.name }}</a>
        {% if project.highlights.count > 0 %}
            <span class="highlights">{{ project.highlights | join: ", " }}</span>
        {% endif %}
    </h1>

    <p>{{ project.description }} </p>

    <p class="repo-link"><a href="{{ project.url }}">github.com/{{ project.fullname }}</a></p>
</div>
"""
}
