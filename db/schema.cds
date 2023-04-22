namespace testformat.db;

using { managed, Currency } from '@sap/cds/common';

entity Products: managed {
    key ID: Integer;
    name: String(100);
    category: String(20);
    price: Integer;
    currency: Currency;
    stock: Integer;
    unit: String(10);
}