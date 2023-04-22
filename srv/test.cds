using {testformat.db as db} from '../db/schema';

service TestSrv {
    @odata.draft.enabled
    entity Products 
    as projection on db.Products  {*, cast(ID as String) as IDStr}
    excluding { createdAt, createdBy, modifiedAt, modifiedBy };

}
 
annotate TestSrv.Products with @(
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Product',
            TypeNamePlural : 'Products',
            
        },
        SelectionFields  : [
            ID, name, category
        ],
        LineItem  : [
            { $Type: 'UI.DataField', Value: IDStr },
            { $Type: 'UI.DataField', Value: name },
            { $Type: 'UI.DataField', Value: category },
            { $Type: 'UI.DataField', Value: price },
            { $Type: 'UI.DataField', Value: currency_code},
            { $Type: 'UI.DataField', Value: stock},
            { $Type: 'UI.DataField', Value: unit},
            { $Type: 'UI.DataField', Value: ID, ![@UI.Hidden]: true ,}
        ],
        HeaderFacets  : [
            { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Header', Label: 'Product Information'}
        ],
        Facets  : [
            { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#General', Label: 'General'}
        ],
        FieldGroup #Header : {
            Data: [
                { $Type: 'UI.DataField', Value: IDStr },
                { $Type: 'UI.DataField', Value: name },
                { $Type: 'UI.DataField', Value: category },
            ]  
        },
        FieldGroup #General : {
            Data: [
                { $Type: 'UI.DataField', Value: stock },
                { $Type: 'UI.DataField', Value: unit },
                { $Type: 'UI.DataField', Value: price },
                { $Type: 'UI.DataField', Value: currency_code },
            ]  
        },
    }
) {
    ID @( Common: { Label : 'Product ID' } );
    IDStr @( Common: { Label : 'Product ID' } );
    name @( Common: { Label : 'Description' } );
    category @(Common: {Label : 'Category',});
    price @(Common: {Label : 'Price',});
    currency_code @(Common: {Label : 'Currency'});
    stock @(Common: {Label : 'Available Stock',});
    unit @(Common: {Label : 'Unit',});
}; 