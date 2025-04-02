
-- Tenant table
CREATE TABLE tenant (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL
);

-- Theme table
CREATE TABLE dashboard_theme (
    id UUID PRIMARY KEY,
    tenant_id UUID REFERENCES tenant(id),
    name TEXT NOT NULL,
    config JSONB
);

-- Dashboard table
CREATE TABLE dashboard (
    id UUID PRIMARY KEY,
    tenant_id UUID REFERENCES tenant(id),
    title TEXT NOT NULL,
    theme_id UUID REFERENCES dashboard_theme(id),
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Widget Bundle table
CREATE TABLE widget_bundle (
    id UUID PRIMARY KEY,
    tenant_id UUID REFERENCES tenant(id),
    title TEXT NOT NULL
);

-- Widget Type table
CREATE TABLE widget_type (
    id UUID PRIMARY KEY,
    bundle_id UUID REFERENCES widget_bundle(id),
    name TEXT NOT NULL,
    descriptor JSONB
);

-- Dashboard Widget Mapping table
CREATE TABLE dashboard_widget_mapping (
    id UUID PRIMARY KEY,
    dashboard_id UUID REFERENCES dashboard(id),
    widget_type_id UUID REFERENCES widget_type(id),
    pos_x INT,
    pos_y INT
);
