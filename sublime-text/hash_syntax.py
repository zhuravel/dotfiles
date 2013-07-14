import sublime, sublime_plugin, re

def new_style_hash(matchobj):
  spaces = len(matchobj.group(3) + matchobj.group(4)) - 1
  if spaces < 1: spaces = 1
  return "%s%s:%s" % (matchobj.group(1), matchobj.group(2), spaces * ' ')

class HashSyntax(sublime_plugin.TextCommand):
  def run(self, edit):
    regions = [region for region in self.view.sel() if not region.empty()]
    if not len(regions):
      regions = [sublime.Region(0, self.view.size())]
    for region in regions:
      self.replace_hashes(edit, region)

  def replace_hashes(self, edit, region):
    s = self.view.substr(region)
    s = re.sub(r'([^\:])\:([a-zA-Z_0-9]*)(\s*)=\>(\s*)', new_style_hash, s)
    self.view.replace(edit, region, s)
