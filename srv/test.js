const cds = require('@sap/cds');

module.exports = cds.service.impl( (srv) => {

    srv.after('READ', 'Products', (lines) => {
        // console.log(lines);
        if(Array.isArray(lines)) {
            lines.map(line => line.IDStr = (!line.IsActiveEntity && line.ID.toString()) || line.IDStr);
        }
        else if (lines && !lines.IsActiveEntity) lines.IDStr = lines.ID.toString();
    });

});