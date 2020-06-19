# Step 1: Download and install package
 curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
 # Alternatively 
 #wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Step 2: Configuration
 export NVM_DIR="$HOME/.nvm"    
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Step 3: Verify your installation
 Check the installed version, by running:
 nvm --version
	# Sample output: 0.35.3



# Example usage
 nvm install 10.0.0    # Install node version 10.0.0
 nvm use 10.0.0        # Use node version 10 (if it is installed)
 nvm run 10.0 app.js   # Run app.js using node version 10.0.x
 nvm --help            # read full nvm manual
