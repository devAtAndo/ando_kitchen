enum FontFamily {
  sans,
}

String getFontFamily(FontFamily family) {
  switch (family) {
    case FontFamily.sans:
      return "IBMPlexSans";
  }
}
