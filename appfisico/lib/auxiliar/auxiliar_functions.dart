String mascaraCpf(String cel) {
  return '(${cel.substring(0, 2)}) ${cel.substring(2, 3)}.${cel.substring(3, 7)}-${cel.substring(7)}';
}