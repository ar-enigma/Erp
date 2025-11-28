# Start from a stable, production-ready ERPNext image
ARG FRAPPE_BRANCH=version-15
FROM frappe/erpnext:${FRAPPE_BRANCH}

# Set the home directory for Frappe user
WORKDIR /home/frappe/frappe-bench

# Copy requirements file and install custom apps
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Final step: install the apps on the main site
# Note: You will install these on the *tenant* sites later using bench commands
# RUN bench --site ${SITE_NAME} install-app hospitality education pos_awesome
