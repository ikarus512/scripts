# Show default macro definitions
g++ -dM -E -x c++ - < /dev/null > default_macros.$(uname)
# Show include paths
g++ -v                         >> default_macros.$(uname)
# Show tools
gcc -dumpspecs                 >> default_macros.$(uname)
